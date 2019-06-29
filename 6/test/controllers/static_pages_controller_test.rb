require 'test_helper'
# This will test reaching home, about, help, and contact pages of static_pages.
# Created 4-12-19 by Anna Yu
class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @base_title = 'StudyBreak'
  end


  # Created and edited 4-12-19 by Anna Yu, test home page
  test 'should get home' do
    get home_path
    assert_response :success
    assert_select 'title', "Home | #{@base_title}"
  end

  # Created and edited 4-12-19 by Anna Yu, test help page
  test 'should get help' do
    get help_path
    assert_response :success
    assert_select 'title', "Help | #{@base_title}"

  end

  # Created and edited 4-12-19 by Anna Yu, test about page
  test 'should get about' do
    get about_path
    assert_response :success
    assert_select 'title', "About | #{@base_title}"

  end
  # Created and edited 4-12-19 by Anna Yu, test contact page
  test 'should get contact' do
    get contact_path
    assert_response :success
    assert_select 'title', "Contact | #{@base_title}"

  end
end
