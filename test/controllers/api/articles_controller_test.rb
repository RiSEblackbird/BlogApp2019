require 'test_helper'

class Api::ArticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_articles_index_url
    assert_response :success
  end

  test "should get show" do
    get api_articles_show_url
    assert_response :success
  end

end
