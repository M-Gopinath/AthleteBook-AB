require 'test_helper'

class Admin::Pages::StatesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

end
