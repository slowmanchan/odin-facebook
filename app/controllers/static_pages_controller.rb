class StaticPagesController < ApplicationController
  def home
    @user = current_user
    if user_signed_in?
      @post = current_user.posts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def about
  end
end
