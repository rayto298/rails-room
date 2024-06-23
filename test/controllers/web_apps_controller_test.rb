require "test_helper"

class WebAppsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get web_apps_index_url
    assert_response :success
  end

  test "should get show" do
    get web_apps_show_url
    assert_response :success
  end

  test "should get new" do
    get web_apps_new_url
    assert_response :success
  end

  test "should get create" do
    get web_apps_create_url
    assert_response :success
  end

  test "should get edit" do
    get web_apps_edit_url
    assert_response :success
  end

  test "should get update" do
    get web_apps_update_url
    assert_response :success
  end

  test "should get destroy" do
    get web_apps_destroy_url
    assert_response :success
  end
end
