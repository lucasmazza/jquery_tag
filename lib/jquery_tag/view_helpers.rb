module Jquery
  module Tag
    module ViewHelpers
      
      def jquery_tag(*options)
        if Rails.env.production?
           javascript_include_tag "http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js", options
         else
           javascript_include_tag "jquery.js", options
        end
      end
    end
  end
end
