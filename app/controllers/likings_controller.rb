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
  end

  private

    def like_params
      params.require(:liking).permit(:like)
    end
end
