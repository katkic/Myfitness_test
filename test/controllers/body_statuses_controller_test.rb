require 'test_helper'

class BodyStatusesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get body_statuses_index_url
    assert_response :success
  end

  test "should get show" do
    get body_statuses_show_url
    assert_response :success
  end

  test "should get edit" do
    get body_statuses_edit_url
    assert_response :success
  end

  test "should get update" do
    get body_statuses_update_url
    assert_response :success
  end

end
