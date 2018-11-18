class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:show,:new,:create]}
  before_action :ensure_correct_user, {only: [:edit,:update]}

  def index
    @posts1 = Post.where(category: 1).order(created_at: :desc)
    @posts2 = Post.where(category: 2).order(created_at: :desc)
    @posts3 = Post.where(category: 3).order(created_at: :desc)
    @posts4 = Post.where(category: 4).order(created_at: :desc)
    @posts5 = Post.where(category: 5).order(created_at: :desc)
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

  def category
    @posts = Post.where(category: params[:category])
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
    params.require(:post).permit(:name,:content,:image,:job,:recommend,:rating,:category).merge(user_id: @current_user.id)
  end
end