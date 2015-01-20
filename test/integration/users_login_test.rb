require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  include Capybara::DSL
  attr_reader :user, :idea1, :idea2

  def setup
    @user = User.create(username: "Chris", password: "Lauren")
    @idea1 = Idea.create(name: "Good Idea", user_id: @user.id)
    @idea2 = Idea.create(name: "Great Idea", user_id: @user.id)
    visit login_path
  end

  test "user sees login page at login path" do
    assert page.has_content?("Please Login")
  end

  test "registered user can login" do
    fill_in "sesh[username]", with: "Chris"
    fill_in "sesh[password]", with: "Lauren"
    click_link_or_button "Login"
    within("#banner") do
      assert page.has_content?("Welcome, Chris")
    end
  end

  test "unregistered user cannot login" do
    fill_in "sesh[username]", with: "ChrisXX"
    fill_in "sesh[password]", with: "LaurenXX"
    click_link_or_button "Login"
    within("#errors") do
      assert page.has_content?("You typed in the wrong username/password")
    end
  end

  test "logged in user sees user's ideas" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    within("#ideas") do
      assert page.has_content?("Great Idea")
    end
  end

  test "logged in user can logout" do
    ApplicationController.any_instance.stubs(:current_user).returns(user)
    visit user_path(user)
    click_link_or_button "Logout"
    assert page.has_content?("Successful logout")
  end

end
