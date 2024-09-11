class BooksController < ApplicationController
  def create
    book = Book.new(params.permit(:title))

    if book.save
      head :ok
    else
      head :unprocessable_entity
    end
  end
end
