class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:show,:new,:create]}
  before_action :ensure_correct_user, {only: [:edit,:update,:destroy]}

  def index
    @posts = Post.all
  end

  def new
    @post=Post.new
  end

  def create
    @post = Post.new(permit_params)
    if @post.save
      redirect_to("/")
    else
      render("posts/new")
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post).permit(:name,:content,:image,:job,:recommend,:rating))
    if @post.save
      redirect_to("/posts/#{@post.id}")
    else
      render("posts/edit")
    end
  end

   def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_to("/")
   end

   def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end

  private
  def permit_params
    params.require(:post).permit(:name,:content,:image,:job,:recommend,:rating).merge(user_id: @current_user.id)
  end
end
