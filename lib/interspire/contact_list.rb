module Interspire
  class ContactList
    attr_reader :id, :name, :subscribe_count, :unsubscribe_count, :auto_responder_count

    # Instantiate with hash of contact list details that should look like this:
    #
    #   {
    #     :id => '42',  # Contact list ID.
    #     :name => 'Serious Contacts',
    #     :subscribe_count => '6420',
    #     :unsubscribe_count => '421',
    #     :auto_responder_count => '124'
    #   }
    #
    # @param details [Hash] A hash of contact list info.
    def initialize(details)
      @id = details[:id]
      @name = details[:name]
      @subscribe_count = details[:subscribe_count]
      @unsubscribe_count = details[:unsubscribe_count]
      @auto_responder_count = details[:auto_responder_count]
    end
  end
end
