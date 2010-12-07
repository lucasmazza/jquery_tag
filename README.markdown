# Jquery_tag
a Rails Helper for togglin' between a local jquery.js file located in /public/javascripts/jquery.js or the hosted script on Google's CDN.
Also supports the same behaviour for a local jquery-ui.js file or the CDN version.

To know more about the benefits of using a CDN for your common Javascript frameworks, check [this Chris Coyier post](http://css-tricks.com/google-cdn-naming/) at [CSS-Tricks](http://css-tricks.com).

## Installation
Just add the `jquery_tag` to your Gemfile and run `bundle install`

## Usage
Inside your views

    <%= jquery_tag %>

Accepted options:

    :version          # Overrides the script version on the CDN URL. Defaults do '1.4.4'
    :file             # Path for the local script. Defaults do 'jquery.js'
    :ui               # Loads the jquery-ui file. Accepts a true value for loading a 'jquery-ui.js' file or a String for the local path.

Any other arguments will be passed along to the `javascript_include_tag` helper.