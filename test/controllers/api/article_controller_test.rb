require 'test_helper'

class Api::ArticleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_article_index_url
    assert_response :success
  end

  test "should get show" do
    get api_article_show_url
    assert_response :success
  end

end
