module JqueryTag # :nodoc:
  ## The Helper implementation for +Ruby on Rails+ applications.
  ## Will be included on +ActionView::Base+ automatically on gem loading.
  module RailsHelper
    include JqueryTag::Helper

    ## Delegates the verification to +Rails.env+
    ## @return [Boolean] true if the current Rails environment is production.
    def production?
      Rails.env.production?
    end

    ## Builds the script tags using the +javascript_included_tag+ method from Rails.
    ## @param [Array] paths_or_urls The paths for the local files or the CDN urls.
    ## @param [Hash] options any other option that should be delivered to +javascript_include_tag+.
    ## @return [String] the concatenated html tags
    def create_javascript_tags(paths_or_urls, options = {})
      arguments = [paths_or_urls, options].flatten
      options = arguments.last.is_a?(Hash) ? arguments.pop : nil

      arguments.map { |path_or_url|
        arguments = [path_or_url, options].compact
        javascript_include_tag(*arguments)
      }.join.html_safe
    end
  end
end