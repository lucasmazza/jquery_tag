require 'test_helper'
class HelperTest < ActionView::TestCase
  tests Jquery::Tag::ViewHelpers

  test "should render a script tag for a local jquery.js file" do
    environment :development do
      assert_match /\/javascripts\/jquery.js/, jquery_tag
    end
  end

  test "should accept a different path for the local script file" do
    environment :development do
      assert_match /\/javascripts\/frameworks\/jquery.min.js/, jquery_tag(:file => "frameworks/jquery.min.js")
    end
  end

  test "should use the Google CDN url when in production environment" do
    environment :production do
      assert_match /ajax.googleapis.com\/\S*\/1.4.2\/jquery.min.js/, jquery_tag
    end
  end

  test "should accept another jquery version for the Google CDN" do
    environment :production do
      assert_match /ajax.googleapis.com\/\S*\/1.4.1\/jquery.min.js/, jquery_tag(:version => "1.4.1")
    end
  end

end


