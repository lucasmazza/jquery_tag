require 'spec_helper'

describe Jquery::Tag::ViewHelpers do
  include Jquery::Tag::ViewHelpers
  
  context "development" do
    before { development! }

    it "renders a local jquery.js file" do
      expects_include_with ['jquery.js']
      jquery_tag
    end
    
    it "accepts a different path for the local jquery file" do
      expects_include_with ['frameworks/jquery.min.js']
      jquery_tag :file => "frameworks/jquery.min.js"
    end
  end
  
  context "production" do
    before { production! }
    
    it "uses the google CDN path" do
      expects_include_with ['http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js']
      jquery_tag
    end
    
    it "accepts a different version for the jquery script" do
      expects_include_with ['http://ajax.googleapis.com/ajax/libs/jquery/1.0.0/jquery.min.js']
      jquery_tag :version => '1.0.0'
    end
  end
end