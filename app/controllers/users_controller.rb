class UsersController < ApplicationController
  before_action :set_user,only:[:show,:followings,:followers]

  def show

   
  end

  def index
    @users = User.all.page(params[:page]).per(16)
  end

  def followings
    @followings = @user.following_users.page(params[:page]).per(16)
  end

  def followers
    @followers = @user.follower_users.page(params[:page]).per(16)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
