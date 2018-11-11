class PostsController < ApplicationController
  before_action :authenticate_user, {only: [:show,:new,:create]}

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
    @post.update(params.require(:post).permit(:name,:content,:image,:job,:recommend))
    if @post.save
      redirect_to("/posts/#{@post.id}")
    else
      render("posts/edit")
    end
  end
  private
  def permit_params
    params.require(:post).permit(:name,:content,:image,:job,:recommend).merge(user_id: @current_user.id)
  end
end
