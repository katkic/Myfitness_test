require 'test_helper'

class WorkoutLogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get workout_logs_index_url
    assert_response :success
  end

end
