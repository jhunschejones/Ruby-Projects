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
    get root_path
    assert_response :success
    # checks for the presence of a <title> tag containing the string “Home | Microblog”.
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | #{@base_title}"
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | #{@base_title}"
  end

  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | #{@base_title}"
  end
end
