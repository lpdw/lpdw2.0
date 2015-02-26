require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end

  test "should get training" do
    get :training
    assert_response :success
  end

  test "should get team" do
    get :team
    assert_response :success
  end

  test "should get work" do
    get :work
    assert_response :success
  end

  test "should get apply" do
    get :apply
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

  test "should get directions" do
    get :directions
    assert_response :success
  end

end
