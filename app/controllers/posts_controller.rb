class PostsController < ApplicationController
  before action :user_signed_in?

  def index
  end

  def new
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Posted!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end