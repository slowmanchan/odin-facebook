class CommentsController < ApplicationController



  def new
  end

  def create
    @post = Post.find(params[:comment][:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      flash[:success] = "Your comment was posted!"
      redirect_to @post
    else
      flash.now[:danger] = "Mistakes were made"
      render @post
    end
  end

  def show
  end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :content)
    end
end
