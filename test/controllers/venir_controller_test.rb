require 'test_helper'

class VenirControllerTest < ActionController::TestCase
  test "should get venir" do
    get :venir
    assert_response :success
  end

end
