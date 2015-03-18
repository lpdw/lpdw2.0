require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  test "should get news" do
    get :news
    assert_response :success
  end

end
