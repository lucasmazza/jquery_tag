# Jquery_tag
a Rails Helper for togglin' between a local jquery.js file `located in /public/javascripts/jquery.js` or the hosted script on Google's CDN.

## Installation
`gem jquery_tag` + `bundle install`

## Usage
Inside your views

    <%= jquery_tag %>

Accepted options:

    :version          # Overrides the script version on the CDN URL. Defaults do '1.4.2'
    :file             # Path for the local script. Defaults do 'jquery.js'
    :args             # Any other arguments that will be passed to the javascript_include_tag helper
