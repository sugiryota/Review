class UsersController < ApplicationController
  before_action :set_user,only:[:show,:followings,:followers]

  def show

   
  end

  def index
    @users = User.all.page(params[:page]).per(16)
  end

  def followings
    @followings = @user.following_users
  end

  def followers
    @followers = @user.follower_users
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
