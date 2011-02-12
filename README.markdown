# Jquery_tag
a Rails Helper for togglin' between a local jquery.js file located in /public/javascripts/jquery.js or the hosted script on Google's CDN.
Also supports the same behaviour for a local jquery-ui.js file or the CDN version.

To know more about the benefits of using a CDN for your common Javascript frameworks, check [this Chris Coyier post](http://css-tricks.com/google-cdn-naming/) at [CSS-Tricks](http://css-tricks.com).

## Installation
Just add the `jquery_tag` to your Gemfile and run `bundle install`.
To download the latest jQuery scripts, check the [jquery-rails](https://github.com/indirect/jquery-rails) gem.

## Usage
Inside your views

    <%= jquery_tag %>

Accepted options:

    :version          # Overrides the script version on the CDN URL. Defaults do '1.5.0'
    :file             # Path for the local script. Defaults do 'jquery.js'
    :ui               # Loads the jquery-ui file. Accepts a true value for loading a 'jquery-ui.js' file or a String for the local path.

Any other arguments will be passed along to the `javascript_include_tag` helper.

## Sinatra
To use the `jquery_tag` on your [Sinatra](http://www.sinatrarb.com/) applications, just include the `JqueryTag::SinatraHelper` on your application

    require 'jquery_tag' # if your not using Bundler.

    class Application < Sinatra::Base
      helpers do
        include JqueryTag::SinatraHelper
      end
    end

Just call the `jquery_tag` helper inside your views or layouts, as in the example above. Your local scripts should be located inside a `./public/javascript` folder (or whatever the Sinatra public path is configurated on your application).