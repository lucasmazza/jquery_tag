Jquery::Routes = ActionDispatch::Routing::RouteSet.new
Jquery::Routes.draw do
  match ':controller(/:action(/:id(.:format)))'
end

class ApplicationController < ActionController::Base; end
ActionController::Base.send :include, Jquery::Routes.url_helpers

# Here we have some lame workarounds for testing.
ENV["RAILS_ASSET_ID"] = ""

module Rails
  def self.env
    @_env ||= ActiveSupport::StringInquirer.new("development")
  end
  
  def self.env=(env)
    @_env = env
  end
end

def environment(env) 
  Rails.env = ActiveSupport::StringInquirer.new(env.to_s)
  yield
end
