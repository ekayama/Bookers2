class UsersController < ApplicationController 
  # def new
    # @user = current_user
    # @user = User.find(params[:id])
    # @books = @user.books
  # end
before_action :is_matching_login_user, only: [:edit, :update]
    

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
    # indexで定義したbookを入れる箱がなかったからBook.newで箱を作る必要がある
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    # showで定義したbookを入れる箱がなかったからBook.newで箱を作る必要がある
  end

  def edit
    if @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      # flash.now[:notice] = "更新error。Name、 Introductionどちらも記入してください"
      render :edit
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end 

end
