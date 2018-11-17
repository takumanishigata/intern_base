class CommentController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find_by(id: params[:post_id])
  end

  def create
    @comment = Comment.new(comment_params)
    @post = Post.find_by(id: params[:post_id])
    if @comment.save
      redirect_to("/posts/#{@post.id}")
    else
      @comment.valid?
      render action: :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.update(params.require(:comment).permit(:title,:content,:job,:recommend,:rating,:post_id).merge(user_id: @current_user.id))
    if @comment.save
      redirect_to("/posts/#{@post.id}")
    else
      render("/posts/#{@post.id}/comment/#{@comment.id}")
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "投稿を削除しました"	
    redirect_to("/posts/#{@comment.post_id}")
  end

  private
  def comment_params
    params.require(:comment).permit(:title,:content,:job,:recommend,:rating,:post_id).merge(user_id: @current_user.id)
  end
end
