require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Tumblr < OmniAuth::Strategies::OAuth

      option :name, 'tumblr'
      option :client_options, {:site => 'http://www.tumblr.com'}

      uid { user['name'] }

      info do
        {
          'nickname' => user['name'],
          'name' => user['title'],
          'image' => user['avatar_url'],
          'urls' => {
            'website' => user['url'],
          }
        }
      end

      extra do
        {'user_hash' => user}
      end

      def user
        tumblelogs = user_hash['tumblr']['tumblelog']
        if tumblelogs.kind_of?(Array)
          @user ||= tumblelogs[0]
        else
          @user ||= tumblelogs
        end
      end

      def user_hash
        url = "http://www.tumblr.com/api/authenticate"
        @user_hash ||= Hash.from_xml(@access_token.get(url).body)
      end
    end
  end
end