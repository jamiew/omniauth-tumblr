OmniAuth Tumblr
================

This gem is an OmniAuth 1.0 Strategy for authenticating with the [Tumblr API](http://developers.tumblr.com)

An example Rails application is available:
<https://github.com/jamiew/omniauth-rails-app>


Usage
-----

Register your application with Tumblr. *Important*: you must specify a default callback URL,
or Tumblr will throw 400 Bad Request errors despite the `?oauth_callback` param. Any URL is fine.

Get started by adding the Tumblr strategy to your `Gemfile`:

```ruby
gem 'omniauth-tumblr'
```

Then add the Tumblr strategy to your Rack middleware:

```ruby
use OmniAuth::Builder do
  provider :tumblr, ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET']
end
```

In Rails, create a file like @config/initializers/omniauth.com@:

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :tumblr, ENV['TUMBLR_KEY'], ENV['TUMBLR_SECRET']
end
```


License
-------

Copyright (c) 2011 Jamie Wilkinson

This source code released under an MIT license.

