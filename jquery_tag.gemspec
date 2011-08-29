# -*- encoding: utf-8 -*-
require File.expand_path('../lib/jquery_tag/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = 'jquery_tag'
  s.version     = JqueryTag::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Lucas Mazza']
  s.email       = ['luc4smazza@gmail.com']
  s.homepage    = 'http://rubygems.org/gems/jquery_tag'
  s.summary     = 'jQuery script tag helper for Rails and Sinatra'
  s.description = 'Helper gem that toggles between local jquery script and Google CDN version based on your app environment'

  s.add_development_dependency 'rspec',   '~> 2.4'
  s.add_development_dependency 'rake',    '~> 0.9.2'

  s.files        = `git ls-files`.split('\n')
  s.executables  = `git ls-files`.split('\n').map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
