class BooksController < ApplicationController
before_action :ensure_correct_user, only: [:edit, :update]

  def new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book)

      # パスの後ろに引数が必要か否かは「rails routes」で
      # 真ん中に表示されるURLに[:id]と記載があるかないか。なかった場合はパスの後ろには何も必要ない
      # 「:id」の記載があった場合には対象となる引数や変数を設定する必要がある
    else
      @books = Book.all
      @user = current_user
      flash[:notice] = ' errors prohibited this obj from being saved:'
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
      render :edit
      end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
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

  def ensure_correct_user
    book = Book.find(params[:id])
    unless book.user.id == current_user.id
      redirect_to books_path
    end
  end


end
