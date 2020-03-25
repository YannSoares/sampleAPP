require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get Home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get Help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get About" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get Contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end


end
