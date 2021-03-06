class LikingsController < ApplicationController
  def create
    @post = Post.find(params[:liking][:post_id])
    @like = @post.likings.build(like_params)
    @like.user_id = current_user.id
    @like.like = true
    if @like.save
      flash[:success] = "You Like"
      redirect_to @post
    else
      redirect_to @post
    end
  end

  def destroy
    @post = Post.find(params[:liking][:post_id])
    @like = Liking.find_by(post_id: params[:liking][:post_id], user_id: current_user.id)
    if @like.destroy
      flash[:success] = "Like removed"
    end
    redirect_to @post

  end

  private

    def like_params
      params.require(:liking).permit(:like)
    end
end
