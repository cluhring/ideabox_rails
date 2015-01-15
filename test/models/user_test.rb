require 'test_helper'

class UserTest < ActiveSupport::TestCase
  attr_reader :user

  def setup
    @user = User.create(username: "Chris", password: "Lauren")
    @idea1 = Idea.create(name: "Great idea!", user_id: @user.id)
    @idea2 = Idea.create(name: "Good idea!", user_id: @user.id)
  end

  def test_user_is_valid
    assert user.valid?
  end

  def test_user_is_invalid_without_password
    user.username = nil
    refute user.valid?
  end

  def test_user_responds_to_ideas_method
    assert_equal "Great idea!", user.ideas.first.name
    assert_equal "Good idea!", user.ideas[1].name
  end

end
