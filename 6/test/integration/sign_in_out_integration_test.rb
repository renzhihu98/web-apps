# Used for integration testing on all static pages, make sure links work.
# Created and edited 4-12-19 by Anna Yu: added help, about, contact links on home page.
# Edited 4-15-19 by Anna Yu: added devise paths to test1 and created test 2.
require 'test_helper'

class SignInOutIntegrationTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :all

  # all links that should be present on the home screen.
  test 'layout links, without sign in' do
    get root_path
    assert_response :success
    assert_select 'a[href=?]', help_path
    assert_select 'a[href=?]', home_path
    assert_select 'a[href=?]', about_path
    assert_select 'a[href=?]', contact_path
    assert_select 'a[href=?]', new_user_registration_path # register new user
    assert_select 'a[href=?]', new_user_confirmation_path # resend confirmation
    assert_select 'a[href=?]', new_user_password_path # forget password
  end

  # all links should be redirected if not signed in (except static pages).
  # Created and edited 4-15-19 by Anna Yu:
  test 'without sign in, try new links' do
    get root_path
    assert_response :success

    get user_profile_path
    assert_response :redirect, 'cannot reach profile page'
    assert_redirected_to new_user_session_path
    get new_book_path
    assert_response :redirect, 'cannot reach new book page'
    assert_redirected_to new_user_session_path
    get search_page_path
    assert_response :redirect, 'cannot reach new search page'
    assert_redirected_to new_user_session_path
    get edit_user_registration_path
    assert_response :redirect, 'cannot reach edit account page'
    assert_redirected_to new_user_session_path
    get home_path
    assert_response :success, 'should reach home'
    get about_path
    assert_response :success, 'should reach about'
    get help_path
    assert_response :success, 'should reach help'
    get contact_path
    assert_response :success, 'should reach contact'
  end
  # after signed in, all links should be accessable without redirect
  # Created and edited 4-15-19 by Anna Yu: tested all new paths and static pages.
  test 'signed in, try all new links' do
    sign_in users(:user1)
    get user_profile_path
    assert_response :success, 'should reach profile page'
    get new_book_path
    assert_response :success, 'should reach new book page'
    get home_path
    assert_response :success, 'should reach home'
    get about_path
    assert_response :success, 'should reach about'
    get help_path
    assert_response :success, 'should reach help'
    get contact_path
    assert_response :success, 'should reach contact'
  end

  # after sign out, all links are again locked until sign in
  # Created 4-15-19 by Anna Yu
  test 'signed in then out, try all links' do
    sign_in users(:user1)
    get user_profile_path
    assert_response :success, 'should reach profile page'
    get new_book_path
    assert_response :success, 'should reach new book page'
    get home_path
    assert_response :success, 'should reach home'
    get about_path
    assert_response :success, 'should reach about'
    get help_path
    assert_response :success, 'should reach help'
    get contact_path
    assert_response :success, 'should reach contact'

    sign_out users(:user1)

    get root_path
    assert_response :success, 'reach log in page'

    get user_profile_path
    assert_response :redirect, 'cannot reach profile page'
    assert_redirected_to new_user_session_path
    get new_book_path
    assert_response :redirect, 'cannot reach new book page'
    assert_redirected_to new_user_session_path
    get search_page_path
    assert_response :redirect, 'cannot reach new search page'
    assert_redirected_to new_user_session_path
    get edit_user_registration_path
    assert_response :redirect, 'cannot reach edit account page'
    assert_redirected_to new_user_session_path
  end

end
