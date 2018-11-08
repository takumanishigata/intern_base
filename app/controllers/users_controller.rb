class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(permit_params)
    @user.save!
    redirect_to("/posts")
  end

  private
  def permit_params
    params.require(:user).permit(:name,:email,:image)
  end
end
