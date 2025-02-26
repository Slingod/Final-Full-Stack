require "test_helper"

class StaticControllerTest < ActionDispatch::IntegrationTest
  test "should get privacy_policy" do
    get static_privacy_policy_url
    assert_response :success
  end

  test "should get members" do
    get static_members_url
    assert_response :success
  end
end
