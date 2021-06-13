class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show,:search,:category,:ranking]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @item = Item.new
    @category = params[:category_id]
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def index
    @items = Item.all.order('created_at DESC').limit(12)
    @ranks = Item.find(Like.group(:item_id).order('count(item_id) DESC').limit(5).pluck(:item_id))
  end
 

  def show
    @message = Message.new
    @messages = @item.messages.includes(:user).order('created_at DESC')
    @like = Like.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def category
    @movie = Item.where(category_id:"2").page(params[:page]).per(16)
    @anime = Item.where(category_id:"3").page(params[:page]).per(16)
    @music = Item.where(category_id:"4").page(params[:page]).per(16)
    @book = Item.where(category_id:"5").page(params[:page]).per(16)
    @other = Item.where(category_id:"6").page(params[:page]).per(16)
    @category= params[:category_id]
  end
  def search
    @items = Item.search(params[:keyword])
  end
  def ranking 
    @ranks = Item.find(Like.group(:item_id).order('count(item_id) DESC').limit(5).pluck(:item_id))
  end




  private

  def item_params
    params.require(:item).permit(:name, :text, :audio, :category_id, :url, :image).merge(user_id: current_user.id)
  end

  def set_item
   
    @item = Item.find(params[:id])
 
  end
end
