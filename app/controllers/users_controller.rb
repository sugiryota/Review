class UsersController < ApplicationController
  before_action :set_user, except: [:index]

  def show
    @followings = @user.following_users
  end

  def index
    @users = User.all.page(params[:page]).per(16)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def followings
    @followings = @user.following_users.page(params[:page]).per(16)
  end

  def followers
    @followers = @user.follower_users.page(params[:page]).per(16)
  end

  def follow_review
    @followings = @user.following_users
  end

  def good_review
  end

  def destroy
    @user.destroy
    redirect_to root_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nickname, :email, :image)
  end
end
