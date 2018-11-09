class PostsController < ApplicationController
  before_action :autheticate_user, {only: [:show,:new,:create]}

  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.new(permit_params)
    @post.save!
    redirect_to("/")
  end

  def show
    @post = Post.find(params[:id])
  end

  private
  def permit_params
    params.require(:post).permit(:name,:content,:image,:job,:recommend)
  end
end
