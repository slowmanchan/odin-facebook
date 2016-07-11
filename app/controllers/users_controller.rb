class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    @user = User.find(params[:id])
    @feed_items = @user.feed.paginate(page: params[:page])
  end

  def updated
  end

  def destroy
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

end
