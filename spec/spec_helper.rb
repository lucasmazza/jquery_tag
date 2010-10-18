require 'jquery_tag/view_helpers'

module Rails
end

module SpecHelper
  def production!
    Rails.stub_chain(:env, :production?) { true }
  end
  
  def development!
    Rails.stub_chain(:env, :production?) { false }
  end
  
  def expects_include_with(*args)
    should_receive(:javascript_include_tag).with(*args)
  end
end

RSpec.configure do |config|
  config.include SpecHelper
end
