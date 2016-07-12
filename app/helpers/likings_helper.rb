module LikingsHelper
  def liking?
     @user = current_user
     @post = Post.find(params[:id])
     @like = @user.likings.find_by(post_id: @post.id)
  end
end
