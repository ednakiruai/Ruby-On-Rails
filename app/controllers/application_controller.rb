class BooksController < ApplicationController
    before_action :authenticate_user!, only: [:borrow, :return_book]
  
    def index
      @books = Book.all
    end
  
    def show
      @book = Book.find(params[:id])
    end
  
    def borrow
      @book = Book.find(params[:id])
      
      if @book.nil?
        redirect_to books_path, alert: 'Book not found.'
      elsif @book.available
        # Create a borrowing record with a due date of 2 weeks from now
        @borrowing = current_user.borrowings.create(book: @book, due_date: 2.weeks.from_now, returned: false)
        # Mark the book as borrowed (not available)
        @book.update(available: false)
        redirect_to profile_path, notice: 'You have successfully borrowed the book!'
      else
        redirect_to book_path(@book), alert: 'Sorry, this book is already borrowed.'
      end
    end
  
    def return_book
      @borrowing = current_user.borrowings.find(params[:id])
      @book = @borrowing.book
      
      if @borrowing.nil?
        redirect_to profile_path, alert: 'This borrowing record does not exist.'
      else
        @borrowing.update(returned: true)
        @book.update(available: true)
        redirect_to profile_path, notice: 'You have successfully returned the book.'
      end
    end
  end
  
  class ProfilesController < ApplicationController
    before_action :authenticate_user!
  
    def show
      @borrowings = current_user.borrowings.where(returned: false)
      if @borrowings.empty?
        flash.now[:notice] = "You have no borrowed books."
      end
    end
  end
  