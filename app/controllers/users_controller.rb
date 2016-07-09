class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.paginate(page: params[:page])
  end

  def show
    @feed_items = current_user.feed.paginate(page: params[:page])
  end

  def updated
  end

  def destroy
  end


end
