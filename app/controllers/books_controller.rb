class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    redirect_to books_path, notice: 'successfully posted'
    else
     @books = Book.all
     render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  # サクセスメッセージが機能しなかった時のため
  # def update
  #   book = Book.find(params[:id])
  #   book.update(book_params)
  #   redirect_to book_path(book)
  # end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
    redirect_to book_path(book), notice: 'successfully posted'
    else
      render :new
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
