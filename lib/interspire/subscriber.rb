module Interspire
  class Subscriber
    attr_reader :id, :email

    # @param id [Integer] The ID of the subscriber.
    # @param email [String] The email of the subscriber.
    def initialize(id, email)
      @id = id
      @email = email
    end
  end
end
