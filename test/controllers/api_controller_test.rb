require 'test_helper'

class ApiControllerTest < ActionController::TestCase
  test "should get get_problems" do
    get :get_problems
    assert_response :success
  end

end
