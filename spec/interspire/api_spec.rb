require 'spec_helper'

describe Interspire::API do

  before do
    @api_url = 'http://example.com/xml.php'
    @user = 'luser'
    @token = 'some_totally_valid_token'

    @api = Interspire::API.new(@api_url, @user, @token)
  end

  context 'authentication' do
    it 'should be authenticated' do
      stub_request(:post, @api_url).to_return(:body => fixture("authenticated.xml"))

      @api.should be_authenticated  # @api.authenticated? should return true
    end

    it 'should not be authenticated' do
      stub_request(:post, @api_url).to_return(:body => fixture("not_authenticated.xml"))

      @api.should_not be_authenticated  # @api.authenticated? should return false
    end
  end

  context 'lists' do
    it 'should get all lists' do
      stub_request(:post, @api_url).to_return(:body => fixture("lists.xml"))

      lists = @api.get_lists

      # Make sure each list has expected values:
      lists.each do |list|
        list[:id].should_not be_nil
        list[:name].should_not be_nil
        list[:subscribe_count].should_not be_nil
        list[:unsubscribe_count].should_not be_nil
        list[:auto_responder_count].should_not be_nil
      end
    end

    it 'should get all subscribers on a list' do
      stub_request(:post, @api_url).to_return(:body => fixture("subscribers.xml"))

      subscribers = @api.get_subscribers(1)  # Contact list ID is arbitrary for this test.

      # Make sure there's a count.
      subscribers[:count].should_not be_nil

      # Make sure the required values are there:
      subscribers[:subscribers].each do |subscriber|
        subscriber[:subscriber_id].should_not be_nil
        subscriber[:email].should_not be_nil
      end
    end
  end

  context 'subscribers' do
    it 'should add the subscriber'
    it 'should delete the subscriber'
    it 'should check if a subscriber is on a list'
  end

end
