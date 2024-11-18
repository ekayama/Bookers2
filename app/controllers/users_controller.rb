class UsersController < ApplicationController
  def index
  end

  def show
    @user = current_user
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to edit_user_path(@user.id)
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
