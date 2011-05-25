require 'jquery_tag'

module Rails
end

module SpecHelper

  def settings
    @_settings ||= mock
  end

  def production!
    settings.stub(:environment) { :production }
    Rails.stub_chain(:env, :production?) { true }
  end

  def development!
    settings.stub(:environment) { :development }
    Rails.stub_chain(:env, :production?) { false }
  end

  def expects_includes_with(args)
    opts = args.last.is_a?(Hash) ? args.pop : nil
    args.each do |value|
      arguments = [value, opts].compact.flatten
      should_receive(:javascript_include_tag).with(*arguments)
    end
  end
end

class String
  def html_safe; self; end
end

RSpec.configure do |config|
  config.include SpecHelper
end
