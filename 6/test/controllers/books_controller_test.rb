# Created by Kordell Stewart on 4/13/19
# This file contains the tests for the books controller
require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :all
  setup do
    @book = books(:one)
    sign_in users(:user1)
  end

  test "should get index" do
    get books_url
    assert_response :success
  end

  test "should get new" do
    get new_book_url
    assert_response :success
  end


  test "should show book" do
    get book_url(@book)
    assert_response :success
  end

  test "should get edit" do
    get edit_book_url(@book)
    assert_response :success
  end

  test "should update book" do
    patch book_url(@book), params: { book: { author: @book.author, classification: @book.classification, description: @book.description, edition: @book.edition, genre: @book.genre, title: @book.title } }
    assert_response :success
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete book_url(@book)
    end

    assert_redirected_to books_url
  end
end
