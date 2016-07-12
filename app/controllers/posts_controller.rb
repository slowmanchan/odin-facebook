class PostsController < ApplicationController
  before_action :user_signed_in?

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
    @post = Post.find(params[:id])
    @feed_items = @post.feed.paginate(page: params[:page])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


end
