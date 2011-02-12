require 'jquery_tag/helper'
require 'jquery_tag/helpers/rails_helper'
# require 'jquery_tag/helpers/sinatra_helper'

ActionView::Base.send(:include, JqueryTag::RailsHelper) if defined? Rails
