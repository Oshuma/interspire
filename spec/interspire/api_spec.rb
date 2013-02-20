require 'spec_helper'

describe Interspire::API do

  before do
    @api_url = 'http://example.com/xml.php'
    @user = 'luser'
    @token = 'some_totally_valid_token'
  end

  context 'authentication' do
    it 'should be authenticated' do
      stub_request(:post, @api_url).to_return(:body => fixture("authenticated.xml"))

      @api = Interspire::API.new(@api_url, @user, @token)
      @api.should be_authenticated  # @api.authenticated? should return true
    end

    it 'should not be authenticated' do
      stub_request(:post, @api_url).to_return(:body => fixture("not_authenticated.xml"))

      @api = Interspire::API.new(@api_url, @user, @token)
      @api.should_not be_authenticated  # @api.authenticated? should return false
    end
  end

  context 'lists' do
    it 'should get all lists'
    it 'should get all subscribers on a list'
  end

  context 'subscribers' do
    it 'should add the subscriber'
    it 'should delete the subscriber'
    it 'should check if a subscriber is on a list'
  end

end
