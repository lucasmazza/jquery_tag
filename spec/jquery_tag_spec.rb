require 'spec_helper'

describe Jquery::Tag::ViewHelpers do
  
  let!(:helper) { Class.new { include Jquery::Tag::ViewHelpers }.new }
  
  context "development" do
    before do
      Rails.stub_chain(:env, :production?) { false }
    end

    it "renders a local jquery.js file" do
      helper.should_receive(:javascript_include_tag).with(['jquery.js'])
      helper.jquery_tag
    end
    
    it "accepts a different path for the local jquery file" do
      helper.should_receive(:javascript_include_tag).with(['frameworks/jquery.min.js'])
      helper.jquery_tag :file => "frameworks/jquery.min.js"
    end
  end
  
  context "production" do
    before do
      Rails.stub_chain(:env, :production?) { true }
    end
    
    it "uses the google CDN path" do
      helper.should_receive(:javascript_include_tag).with(['http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js'])
      helper.jquery_tag
    end
    
    it "accepts a different version for the jquery script" do
      helper.should_receive(:javascript_include_tag).with(['http://ajax.googleapis.com/ajax/libs/jquery/1.0.0/jquery.min.js'])
      helper.jquery_tag :version => '1.0.0'
    end
  end
end