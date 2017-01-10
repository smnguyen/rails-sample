require 'test_helper'

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @inactive_user = users(:inactive)
  end

  test "page for an inactive user should not be visible" do
    get user_path(@inactive_user)
    follow_redirect!
    assert_template 'static_pages/home'
  end
end