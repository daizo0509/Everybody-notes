require 'test_helper'

class AdminPageControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get admin_page_top_url
    assert_response :success
  end

  test "should get posts-index" do
    get admin_page_posts-index_url
    assert_response :success
  end

  test "should get users-index" do
    get admin_page_users-index_url
    assert_response :success
  end

  test "should get tags-index" do
    get admin_page_tags-index_url
    assert_response :success
  end

end
