require 'test_helper'

class VideosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get videos_index_url
    assert_response :success
  end

  test "should get update" do
    get videos_update_url
    assert_response :success
  end

end
