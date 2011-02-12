module JqueryTag
  ## The Helper implementation for +Sinatra+ applications.
  ## you should manually include this Module as a helper inside your application
  ##  class MyApp < Sinatra::Base
  ##    helpers do
  ##      include JqueryTag::SinatraHelper
  ##    end
  ##  end
  module SinatraHelper
    include JqueryTag::Helper

    ## Delegates the verification to Sinatra +settings+ object and check it's environment value.
    ## @return [Boolean] true if the application is in the production environment.
    def production?
      settings.environment == :production
    end

    ## A Simple helper that concatenates the html for the script tags.
    ## @param [Array] paths_or_urls The paths for the local files or the CDN urls.
    ## @param [Hash] options the current implementation doesn't use the options hash.
    ## @return [String] the concatenated html tags
    def javascript_tag(paths_or_urls, options = {})
      paths_or_urls.map { |path| build_tag(path) }.join
    end

    private
    def build_tag(path_or_url)
      path_or_url = "/javascripts/#{path_or_url}" unless production?
      %Q{<script type="text/javascript" src="#{path_or_url}"></script>}
    end
  end
end