require 'jquery_tag/helper'
require 'jquery_tag/helpers/rails_helper'
require 'jquery_tag/helpers/sinatra_helper'

module JqueryTag # :nodoc:
  ## @return [String] the current (mostly latest) version of jQuery.
  def self.version;    '1.6.2'; end
  ## @return [String] the current (mostly latest) version of jQuery UI.
  def self.ui_version; '1.8.16'; end
end

ActionView::Base.send(:include, JqueryTag::RailsHelper) if defined? Rails
