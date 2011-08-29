# Jquery_tag

[![Build Status](https://secure.travis-ci.org/lucasmazza/jquery_tag.png)](http://travis-ci.org/lucasmazza/jquery_tag)


A Helper gem for both Rails and Sinatra for toggling between a local jquery.js file or the hosted script on Google's CDN based on your application environment, avoiding network dependency during development and bandwidth usage when your application goes live.
It also supports the same behavior for a loading the jQuery UI script.

To know more about the benefits of using a CDN for your common Javascript frameworks, check [this Chris Coyier post](http://css-tricks.com/google-cdn-naming/) at [CSS-Tricks](http://css-tricks.com).

## Installation
If you're using [Bundler](http://gembundler.com), just add the `jquery_tag` to your Gemfile and run `bundle install`. If not, `gem install jquery_tag` and `require 'jquery_tag'` inside your application code.

To download the latest jQuery script to your application just run `jquery_tag` command inside your Terminal and the script will be downloaded to `public/javascripts/jquery.js`. You can check the available options running it with the `-h` flag.

## Usage
Inside your views, you can just call the `jquery_tag` method.

```erb
<%= jquery_tag %>
```

It accepts a some configuration options by using the following symbols:

    :version          # Overrides the script version on the CDN URL. Defaults do '1.6.2'
    :file             # Path for the local script. Defaults do 'jquery.js'
    :ui               # Loads jQuery UI. Accepts a true value for loading a 'jquery-ui.js' file or a String for the local path.

Any other arguments will be passed along to the `javascript_include_tag` helper, if inside a Rails application. The [Sinatra Helper](https://github.com/lucasmazza/jquery-tag/blob/master/lib/jquery_tag/helpers/sinatra_helper.rb) currently ignores any extra option.

## Sinatra
To use the `jquery_tag` on your [Sinatra](http://www.sinatrarb.com/) applications, just include the `JqueryTag::SinatraHelper` on your application

```ruby
require 'jquery_tag' # if your not using Bundler.

class Application < Sinatra::Base
  helpers do
    include JqueryTag::SinatraHelper
  end
end
```

Just call the `jquery_tag` helper inside your views or layouts, as in the example above. Your local scripts should be located inside a `./public/javascripts/` folder (or whatever the Sinatra public path is configured on your application).