require 'spec_helper'

describe JqueryTag::RailsHelper do
  include JqueryTag::RailsHelper

  context "development" do
    before { development! }

    it "renders a local jquery.js file" do
      expects_include_with ['jquery.js']
      jquery_tag
    end

    it "delegates any other arguments" do
      expects_include_with ['jquery.js', 'application.js']
      jquery_tag 'application.js'
    end

    it "accepts a different path for the local jquery file" do
      expects_include_with ['frameworks/jquery.min.js']
      jquery_tag :file => "frameworks/jquery.min.js"
    end

    it "renders the jquery-ui.js file" do
      expects_include_with ['jquery.js', 'jquery-ui.js']
      jquery_tag :ui => true
    end

    it "receives a path to the jquery-ui.js file" do
      expects_include_with ['jquery.js', 'frameworks/jquery-ui.js']
      jquery_tag :ui => 'frameworks/jquery-ui.js'
    end
  end

  context "production" do
    before { production! }

    it "uses the google CDN path" do
      expects_include_with ['//ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js']
      jquery_tag
    end

    it "accepts a different version for the jquery script" do
      expects_include_with ['//ajax.googleapis.com/ajax/libs/jquery/1.0.0/jquery.min.js']
      jquery_tag :version => '1.0.0'
    end

    it "uses the google CDN path for the jquery ui script" do
      expects_include_with ['//ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js', '//ajax.googleapis.com/ajax/libs/jqueryui/1.8.9/jquery-ui.min.js']
      jquery_tag :ui => true
    end
  end
end