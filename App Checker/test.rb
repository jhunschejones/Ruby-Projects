require 'test/unit'
require './app_checker.rb'

class AppCheckerTests < Test::Unit::TestCase

  def setup
    @app_checker = AppChecker.new
    @app_checker.required_apps = ["Notes", "Safari"]
  end

  def test_navigate_to_applications_dir
    @app_checker.navigate_to_applications_dir
    assert_equal("/Applications", Dir.pwd)
  end

  def test_check_for_required_apps
    other_apps = @app_checker.get_app_list
    a, b, c = @app_checker.check_for_required_apps(other_apps)
    assert_equal(a, "-%20[%20]%20Notes\n-%20[%20]%20Safari\n")
    assert_equal(b, ["- Notes", "- Safari"])
    # not testing other_apps at this time, results will be system-dependant
  end

  def teardown
  end
end