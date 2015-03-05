class BooksController < ApplicationController
  def show
    @book = Book.find(params[:id])
  end

  def index
    @books, @tag = Book.search_by_tag_name(params[:tag])
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(books_params)
    if @book.save
      flash[:notice] = "Book was created."
      redirect_to books_path
    else
      render :new
    end
  end

  def edit
    @book = Book.find params[:id]
  end

  def update
    @book = Book.find params[:id]
    if @book.update_attributes(book_params)
      flash[:notice] = "Book was updated."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = Book.find params[:id]
    book.destroy
    flash[:notice] = "#{book} was destroyed."
    redirect_to books_path
  end

  private

  def article_params
    params.require(:book).permit(:title, :body)
  end

end
