class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(permit_params)
    @post.save!
    redirect_to("/posts")
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def permit_params
    params.require(:post).permit(:name,:content,:image,:job,:recommend)
  end
end
