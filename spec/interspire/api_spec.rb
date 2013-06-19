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
        list.id.should_not be_nil
        list.name.should_not be_nil
        list.subscribe_count.should_not be_nil
        list.unsubscribe_count.should_not be_nil
        list.auto_responder_count.should_not be_nil
      end
    end

    it 'should get all subscribers on a list' do
      stub_request(:post, @api_url).to_return(:body => fixture("subscribers.xml"))

      subscribers = @api.get_subscribers(1)  # Contact list ID is arbitrary for this test.

      # Make sure there's a count.
      subscribers[:count].should_not be_nil
      subscribers[:count].should be_a(Integer)

      # Make sure the required values are there:
      subscribers[:subscribers].each do |subscriber|
        subscriber.id.should_not be_nil
        subscriber.id.should be_a(Integer)

        subscriber.email.should_not be_nil
      end
    end
  end

  context 'subscribers' do
    it 'should add the subscriber' do
      stub_request(:post, @api_url).to_return(:body => fixture("add_subscriber.xml"))
      subscriber_id = @api.add_subscriber(1, 'foo@example.com')  # '1' is the (fake) contact list ID.
      subscriber_id.should be_a(Integer)
    end

    it 'should delete the subscriber' do
      stub_request(:post, @api_url).to_return(:body => fixture("delete_subscriber.xml"))
      @api.delete_subscriber(1, 'foo@example.com').should be_true
    end

    it 'should be in contact list' do
      stub_request(:post, @api_url).to_return(:body => fixture("in_contact_list.xml"))
      @api.in_contact_list?(1, 'foo@example.com').should be_true
    end

    it 'should not be in contact list' do
      stub_request(:post, @api_url).to_return(:body => fixture("not_in_contact_list.xml"))
      @api.in_contact_list?(1, 'foo@example.com').should_not be_true
    end
    
    it 'should update the subscriber custom field' do
      stub_request(:post, @api_url).to_return(:body => fixture("update_subscriber_custom_field.xml"))
      # '1' is the (fake) contact ID
      # '2' is the (fake) custom field ID
      response = @api.update_subscriber_custom_field(1,2,"Jane")
      response.should be_true
    end
  end

end
