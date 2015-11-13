require 'spec_helper'

describe OmniAuth::Strategies::Tumblr do

  subject do
    OmniAuth::Strategies::Tumblr.new({})
  end

  context "client options" do
    it 'should have correct name' do
      subject.options.name.should eq("tumblr")
    end

    it 'should have correct site' do
      subject.options.client_options.site.should eq("https://www.tumblr.com")
    end
  end
end
