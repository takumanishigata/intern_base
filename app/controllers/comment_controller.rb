class CommentController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to("/")
    else
      @comment.valid?
      render action: :new
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:title,:content,:job,:recommend,:rating,:post_id).merge(user_id: @current_user.id)
  end
end
