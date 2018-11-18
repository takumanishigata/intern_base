require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get rules" do
    get home_rules_url
    assert_response :success
  end

  test "should get privacy" do
    get home_privacy_url
    assert_response :success
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success
  end

end
