class BooksController < ApplicationController
  def new
    
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to books_path
    else
      flash.now[:notice] = "投稿に失敗"
      render :index
    end
  end 

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to book_path(@book)
    else
      flash.now[:notice] = "更新失敗"
      render :edit
    end
  end

  def show
    @user = current_user
    @book = Book.find(params[:id])
    @book_new = Book.new
  end

  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      flash[:notice] = "You have destroyed book successfully."
      redirect_to books_path
    end
  end


  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end
