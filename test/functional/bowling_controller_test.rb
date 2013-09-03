require 'test_helper'

class BowlingControllerTest < ActionController::TestCase
  test "should get frame" do
    get :frame
    assert_response :success
  end

end
