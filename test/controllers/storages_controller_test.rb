require "test_helper"

class StoragesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get storages_index_url
    assert_response :success
  end

  test "should get show" do
    get storages_show_url
    assert_response :success
  end

  test "should get update" do
    get storages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get storages_destroy_url
    assert_response :success
  end
end
