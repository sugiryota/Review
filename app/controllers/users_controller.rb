class UsersController < ApplicationController
  before_action :set_user,only:[:show,:followings,:followers,:follow_review,:good_review]

  def show
    @followings = @user.following_users
   
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

  def follow_review
    @followings = @user.following_users
  end

  def good_review

  end

 


  private

  def set_user
    @user = User.find(params[:id])
  end

end
