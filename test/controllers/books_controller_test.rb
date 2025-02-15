# test/controllers/books_controller_test.rb
require 'test_helper'
class BooksControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
      get books_url
      assert_response :success
    end
  
    test "should borrow book" do
      user = users(:one)
      book = books(:available_book)
      sign_in user
  
      assert_difference('Borrowing.count', 1) do
        post borrow_book_url(book)
      end
      assert_redirected_to profile_path
      assert_not book.reload.available
    end
  
    test "should not borrow already borrowed book" do
      user = users(:one)
      book = books(:borrowed_book)
      sign_in user
  
      post borrow_book_url(book)
      assert_redirected_to book_path(book)
      assert_equal 'Sorry, this book is already borrowed.', flash[:alert]
    end
  end
  