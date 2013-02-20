require 'spec_helper'

describe Interspire::API do

  before do
    @api_url = 'http://example.com/xml.php'
    @user = 'luser'
    @token = 'some_totally_valid_token'
  end

  context 'authentication' do
    it 'should be authenticated'
    it 'should not be authenticated'
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
