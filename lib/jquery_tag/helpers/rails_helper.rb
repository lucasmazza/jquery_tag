module JqueryTag
  module RailsHelper
    include JqueryTag::Helper

    def production?
      Rails.env.production?
    end

    def javascript_tag(paths, options = {})
      arguments = paths + [options].flatten
      javascript_include_tag(arguments)
    end
  end
end