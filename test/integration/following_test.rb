require 'test_helper'

class FollowingTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @other = users(:archer)
    log_in_as(@user)
  end

  test "following page" do
    get following_user_path(@user)
    assert_not @user.following.empty?
    assert_match @user.following.count.to_s, response.body
    @user.following.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end

  test "followers page" do
    get followers_user_path(@user)
    assert_not @user.followers.empty?
    assert_match @user.followers.count.to_s, response.body
    @user.followers.each do |user|
      assert_select "a[href=?]", user_path(user)
    end
  end


  test "should follow a user with Ajax" do
    othera = users(:archer)
    assert_difference '@user.following.count', 1 do
      post relationships_path, xhr: true, params: { followed_id: othera.id }
    end
  end



  test "should unfollow a user with Ajax" do
    othera = users(:archer)
    @user.follow(othera)
    relationship = @user.active_relationships.find_by(followed_id: othera.id)
    assert_difference '@user.following.count', -1 do
      delete relationship_path(relationship), xhr: true
    end
  end

end
