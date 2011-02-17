module JqueryTag # :nodoc:
  ## +jQueryTag::Helper+ is the abstract base for real Helper module
  ## that should be used.
  ##
  ## This Module is responsible for the argument parsing and the public api
  ## of the +jquery_tag+ method, that you should use inside your views and layouts.
  ##
  ## == Usage
  ## inside your application.html.erb, just above the closing body tag.
  ##  <%= jquery_tag %>
  ## During development, the given helper will render something like this:
  ##  <script type="text/javascript" src="/javascripts/jquery.js"></script>
  ## Your application will be using a local version of jQuery, avoiding any network usage. Once you
  ## shift to production mode, the ouput will be:
  ##  <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>
  ## Reducing your server bandwidth load and sharing the same cached file from many other sites.
  ##
  ## == Dependencies
  ## +jQueryTag::Helper+ relies on two other methods that should be implemented:
  ##
  ## * +production?+ - it should return +true+ if the application is on  production mode. Otherwise, false.
  ## * +javascript_tag(paths, options)+ - responsible for building the tags for the given paths array. Any other option should be passed on the second argument, a options hash.
  module Helper

    ## Builds the proper script tags for a suitable url or path for both jQuery or jQuery UI scripts.
    ##
    ## @option :file [String] an alternative path for the local jquery.js file. Defaults to `jquery.js`
    ## @option :version [String] tells the helper to target a different version of jQuery hosted on Google's CDN. Defaults to JqueryTag.version
    ## @option :ui [String, TrueClass] loads the jQuery UI File. Can be a [TrueClass] or a [String], overriding the local path for the script.
    ## Any other argument will be delivered to the +javascript_tag+ method.
    ##
    ## @return [String] the html tags to include scripts
    def jquery_tag(*arguments)
      options = extract_options(arguments)
      paths = []
      paths << jquery_file(options[:file], options[:version])
      paths << jquery_ui_file(options[:ui]) if options[:ui]

      javascript_tag(paths, arguments)
    end

    private

    def extract_options(arguments)
      keys = [:file, :version, :ui]
      if arguments.last.is_a?(Hash)
        options = Hash[keys.map { |o| [o, arguments.last.delete(o)] }]
        arguments.pop if arguments.last.empty?
      else
        options = {}
      end
      options
    end

    def jquery_file(path, version)
      path ||= 'jquery.js'
      version ||= JqueryTag.version
      production? ? "//ajax.googleapis.com/ajax/libs/jquery/#{version}/jquery.min.js" : path
    end

    def jquery_ui_file(path)
      path = path.is_a?(String) ? path : "jquery-ui.js"
      version = JqueryTag.ui_version
      production? ? "//ajax.googleapis.com/ajax/libs/jqueryui/#{version}/jquery-ui.min.js" : path
    end
  end
end