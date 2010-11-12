module Jquery
  module Tag
    module ViewHelpers
      def jquery_tag(*args)

        options = args.first.is_a?(Hash) ? args.pop : {}

        args.unshift(jquery_ui_file(options[:ui])) if options[:ui]
        args.unshift(jquery_file(options[:file], options[:version]))

        javascript_include_tag args
     end

     private
     def jquery_file(path, version)
       path ||= 'jquery.js'
       version ||= '1.4'
       Rails.env.production? ? "http://ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js" : path
     end

     def jquery_ui_file(path)
       path = path.is_a?(String) ? path : "jquery-ui.js"
       Rails.env.production? ? 'http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js' : path
     end
    end
  end
end
