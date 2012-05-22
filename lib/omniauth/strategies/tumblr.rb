require 'omniauth-oauth'
require 'multi_json'

module OmniAuth
  module Strategies
    class Tumblr < OmniAuth::Strategies::OAuth

      option :name, 'tumblr'
      option :client_options, {:site => 'http://www.tumblr.com'}

      uid { raw_info['name'] }

      info do
        {
          :nickname => raw_info['name'],
          :name => raw_info['name'],
          :blogs => raw_info['blogs'].map do |b|
            { :name => b['name'], :url => b['url'], :title => b['title'] }
          end,
          :avatar => avatar_url
        }
      end

      extra do
        { :raw_info => raw_info.merge({ :avatar => avatar_url }) }
      end

      def user
        tumblelogs = user_hash['tumblr']['tumblelog']
        if tumblelogs.kind_of?(Array)
          @user ||= tumblelogs[0]
        else
          @user ||= tumblelogs
        end
      end

      def raw_info
        url = 'http://api.tumblr.com/v2/user/info'
        @raw_info ||= MultiJson.decode(access_token.get(url).body)['response']['user']
      end

      def avatar_url
        url = "http://api.tumblr.com/v2/blog/#{ raw_info['blogs'].first['url'].sub(%r|^https?://|, '').sub(%r|/?$|, '') }/avatar"
        res = access_token.get(url).body
        @avatar_url ||= MultiJson.decode(res)['response']['avatar_url']
      end
    end
  end
end
