class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :category, :ranking, :pv_ranking, :comment_ranking]
  before_action :set_item, only: [:show, :edit, :update, :destroy,:like_user]
  impressionist actions: [:show]

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
    @items = Item.includes(:user).all.order('created_at DESC').limit(12)
    @ranks = Item.find(Like.group(:item_id).order('count(item_id) DESC').limit(5).pluck(:item_id))
  end

  def show
    @message = Message.new
    @messages = @item.messages.includes(:user).order('created_at DESC')
    @messages.each do |message|
      @mess = message
    end
    @like = Like.new
    @views = @item.impressions.size
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
    @movie = Item.where(category_id: '2').page(params[:page]).per(16)
    @anime = Item.where(category_id: '3').page(params[:page]).per(16)
    @music = Item.where(category_id: '4').page(params[:page]).per(16)
    @book = Item.where(category_id: '5').page(params[:page]).per(16)
    @other = Item.where(category_id: '6').page(params[:page]).per(16)
    @category = params[:category_id]
  end

  def search
    @items = Item.search(params[:keyword]).page(params[:page]).per(16)
  end

  def ranking
    @ranks = Item.find(Like.group(:item_id).order('count(item_id) DESC').limit(5).pluck(:item_id))
  end

  def comment_ranking
    @comment_ranks = Item.find(Message.group(:item_id).order('count(item_id) DESC').limit(5).pluck(:item_id))
  end

  def pv_ranking
    @pv_ranking = Item.find(Impression.group(:impressionable_id).order('count(impressionable_id) desc').limit(5).pluck(:impressionable_id))
  end
  def like_user
    
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :audio, :category_id, :url, :image, :minicategory).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
