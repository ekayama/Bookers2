class BookCommentsController < ApplicationController

  def create
    book = Book.find(params[:book_id])
    comment = current_user.book_comments.new(book_comment_params)

    comment.book_id = book_id
    comment.save
    redirect_to book_path(book_comment)
  end

  def destroy
    Book.find(params[:id]).destroy
    redirect_to book_path(params[:book_id])

private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end

