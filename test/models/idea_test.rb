require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  attr_reader :user, :idea1, :idea2

  def setup
    @user = User.create(username: "Chris", password: "Lauren")
    @idea1 = Idea.create(name: "Great idea!", user_id: @user.id)
    @idea2 = Idea.create(name: "Good idea!", user_id: @user.id)
  end

  def test_idea_is_valid
    assert_equal true, user.valid?
  end

  def test_idea_is_invalid_without_name
    idea1.name = nil
    assert idea1.invalid?
  end

  def test_idea_must_have_a_referencen_to_a_person
    assert_equal "Chris", idea1.user.username
  end
end
