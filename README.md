OmniAuth Tumblr
================

This gem is an OmniAuth 1.0 Strategy for authenticating with the [Tumblr API](http://developers.tumblr.com)


Usage
-----

Register your application with Tumblr. *Important*: specify a default callback URL or
Tumblr will throw 400 Bad Request errors. Any URL is fine.

Get started by adding the Tumblr strategy to your `Gemfile` along with Omniauth:

```ruby
gem 'omniauth'
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

This source code released under an MIT license.

(c) 2011 Jamie Wilkinson