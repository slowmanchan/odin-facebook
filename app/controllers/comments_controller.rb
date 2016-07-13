class CommentsController < ApplicationController
  before_action :user_signed_in?

  def edit
    @comment = Comment.find[params[:id]]
  end
  
  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment was posted!"
      redirect_to @post
    else
      flash[:danger] = "Mistakes were made"
      redirect_to @post
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
