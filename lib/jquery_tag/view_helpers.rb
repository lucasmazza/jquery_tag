module Jquery
  module Tag
    module ViewHelpers
      def jquery_tag(options = {})
        arguments = options.delete(:args) || []
        path = options.delete(:file) || "jquery.js"
        version = options.delete(:version) || "1.4.2"
        path = "http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js" if Rails.env.production?
        arguments.unshift(path)

        javascript_include_tag arguments
     end
    end
  end
end
