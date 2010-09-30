require 'test_helper'
class HelperTest < ActionView::TestCase
  tests Jquery::Tag::ViewHelpers
  
  test "should render a script tag for a local jquery.js file" do
    assert_match /\/javascripts\/jquery.js/, jquery_tag
  end
  
  test "should use the google CDN url when in production environment" do
    environment :production do
      assert_match /ajax.googleapis.com\/\S*\/jquery.min.js/, jquery_tag
    end
  end
end


