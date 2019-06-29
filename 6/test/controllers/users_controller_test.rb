require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  fixtures :all
  setup do
    sign_in users(:user1)
  end
  test 'should get profile' do
    get user_profile_url
    assert_response :success
  end

  test 'should get library' do
    get user_library_url
    assert_response :success
  end

  test 'should get comments' do
    get user_comment_url
    assert_response :success
  end

  test 'should get reviews' do
    get user_review_url
    assert_response :success
  end
end
