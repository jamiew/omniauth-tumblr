OmniAuth Tumblr
================

This gem is an OmniAuth 1.0 Strategy for authenticating with the [Tumblr API](http://developers.tumblr.com)

An example Rails application is available:
<https://github.com/jamiew/omniauth-rails-app>


Setup
-----

Register your application with [Tumblr](http://www.tumblr.com/oauth/apps).

*Important*: your callback URL needs to be specified as `http://[hostname]/auth/tumblr/callback`.
The Tumblr API does not respect the dynamic ?oauth_callback URL passed by Omniauth. ([related thread](https://groups.google.com/forum/?fromgroups#!searchin/tumblr-api/callback$20url/tumblr-api/5k_afNDUB5s/gfaNMnRtINoJ))

In order to authenticate with Tumblr in both development and production we recommend
registering a "-dev" app with Tumblr which points at localhost:3000 or yourapp.dev (not ideal)

Using services like https://ngrok.com works like a charm.

Usage
-----

Get started by adding the Tumblr strategy to your `Gemfile`:

```ruby
gem 'omniauth-tumblr'
```

In a Rails app, add the Tumblr provider to your Omniauth middleware, e.g.
in a file like @config/initializers/omniauth.rb@:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tumblr, ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET']
end
```

In any Rack app you can add the Tumblr strategy like so:

```ruby
use OmniAuth::Builder do
  provider :tumblr, ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET']
end
```

License
-------

Copyright (c) 2011-2012 [Jamie Wilkinson](http://jamiedubs.com)

This source code released under an MIT license.

