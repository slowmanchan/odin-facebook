class PostsController < ApplicationController
  before_action :user_signed_in?, only: [:edit, :destroy]

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Edited!"
      redirect_to root_url
    else
      flash.now[:danger] = "Mistakes were made"
      render 'edit'
    end
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

  def show
    @post = Post.find(params[:id])
    @feed_items = @post.feed.paginate(page: params[:page], :per_page => 10)
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Deleted!"
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end


end
