require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  # this is a special function which is automatically run before every test by rails
  def setup
    @base_title = "Microblog"
  end

  test "should get root" do
    get '/'
    assert_response :success
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    # checks for the presence of a <title> tag containing the string “Home | Microblog”.
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end
end
