require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get homepage" do
    get :homepage
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

end
