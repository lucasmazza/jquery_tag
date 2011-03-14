require 'spec_helper'

describe JqueryTag::SinatraHelper do
  include JqueryTag::SinatraHelper

  context "in development environment" do
    before { development! }

    it "renders a local jquery.js file" do
      jquery_tag.should == %Q{<script type="text/javascript" src="/javascripts/jquery.js"></script>}
    end

    it "delegates any other arguments"

    it "accepts a different path for the local jquery file" do
      jquery_tag(:file => "frameworks/jquery.min.js").should == %Q{<script type="text/javascript" src="/javascripts/frameworks/jquery.min.js"></script>}
    end

    it "renders the jquery-ui.js file" do
      expected = %Q{<script type="text/javascript" src="/javascripts/jquery.js"></script>}
      expected << %Q{<script type="text/javascript" src="/javascripts/jquery-ui.js"></script>}
      jquery_tag(:ui => true).should == expected
    end

    it "receives a path to the jquery-ui.js file" do
      expected = %Q{<script type="text/javascript" src="/javascripts/jquery.js"></script>}
      expected << %Q{<script type="text/javascript" src="/javascripts/frameworks/jquery-ui.js"></script>}
      jquery_tag(:ui => 'frameworks/jquery-ui.js').should == expected
    end
  end

  context "in production environment" do
    before { production! }

    it "uses the google CDN path" do
      expected = %Q{<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>}
      jquery_tag.should == expected
    end

    it "accepts a different version for the jquery script" do
      expected = %Q{<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.0.0/jquery.min.js"></script>}
      jquery_tag(:version => '1.0.0').should == expected
    end

    it "uses the google CDN path for the jquery ui script" do
      expected = %Q{<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script>}
      expected << %Q{<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.10/jquery-ui.min.js"></script>}
      jquery_tag(:ui => true).should == expected
    end
  end
end