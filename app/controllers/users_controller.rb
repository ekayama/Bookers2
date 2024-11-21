class UsersController < ApplicationController 
  # def new
    # @user = current_user
    # @user = User.find(params[:id])
    # @books = @user.books
  # end
    

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to edit_user_path(@user.id)
    else
      flash.now[:notice] = "更新失敗"
      render :edit
    end

  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
