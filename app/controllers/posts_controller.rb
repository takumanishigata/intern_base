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

  private
  def permit_params
    params.require(:post).permit(:name,:content,:image)
  end
end
