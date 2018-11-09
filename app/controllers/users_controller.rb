class UsersController < ApplicationController
  before_action :authenticate_user, {only: [:show]}
  before_action :forbid_login_user, {only: [:new, :create, :login_form, :login]}
  def show
    @user = User.find(params[:id])
    @likes = Like.where(user_id: @user.id)
  end

  def new
  end

  def create
    @user = User.new(permit_params)
    if @user.save!
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/")
    else
      render("users/new")
    end
  end

  def login_form
  end

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      @email = params[:email]
      @password = params[:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/login")
  end

  private
  def permit_params
    params.require(:user).permit(:name,:email,:image,:password)
  end
end
