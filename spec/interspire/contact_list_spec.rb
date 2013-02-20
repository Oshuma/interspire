require 'spec_helper'

describe Interspire::ContactList do

  before do
    @details = {
      :id => 4,
      :name => 'List Foo',
      :subscribe_count => 321,
      :unsubscribe_count => 123,
      :auto_responder_count => 4,
    }

    @list = Interspire::ContactList.new(@details)
  end

  context 'accessors' do
    it 'id' do; @list.id.should == @details[:id]; end
    it 'name' do; @list.name.should == @details[:name]; end
    it 'subscribe_count' do; @list.subscribe_count.should == @details[:subscribe_count]; end
    it 'unsubscribe_count' do; @list.unsubscribe_count.should == @details[:unsubscribe_count]; end
    it 'auto_responder_count' do; @list.auto_responder_count.should == @details[:auto_responder_count]; end
  end

end
