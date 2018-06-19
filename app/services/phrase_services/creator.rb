# frozen_string_literal: true

module PhraseServices
  # Service which will create phrase for the recipient. Given a raw data and ID
  # of recipient then output a Phrase and a Recipient
  #
  # @!attribute [r] recipient
  #   @return [Recipient] the recipient who owning phrase
  # @!attribute [r] phrase
  #   @return [Phrase] the created phrase
  # @example
  #   PhraseServices::Creator.new({term: "String"}, recipient_uid: 1).call
  class Creator
    attr_reader :recipient, :phrase

    # @param [Hash<String>] data
    # @option data [String] :term Required
    # @option data [String] :spelling
    # @option data [String] :meaning
    # @param [String, Integer] recipient_uid ID of recipient from message
    # @return [self]
    def initialize(data, recipient_uid:)
      @data         = data
      @recipient_uid = recipient_uid
    end

    # Create a Recipient and a Phrase if they are not existed yet
    # @return [self]
    def call
      @recipient = Recipient.find_or_create_by(uid: recipient_uid)
      @phrase = Phrase.find_or_create_by(term: data[:term], recipient: @recipient) do |phr|
        phr.meaning   = data[:meaning]
        phr.spelling  = data[:spelling]
      end
      self
    end

    private

    attr_reader :data, :recipient_uid
  end
end
