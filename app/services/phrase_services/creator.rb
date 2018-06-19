# frozen_string_literal: true

module PhraseServices
  class Creator
    attr_reader :recipient, :phrase

    def initialize(data, recipient_uid:)
      @data         = data
      @recipient_uid = recipient_uid
    end

    def call
      @recipient = Recipient.find_or_create_by(uid: recipient_uid)
      @phrase = Phrase.find_or_create_by(term: data[:term], recipient: @recipient) do |phr|
        phr.meaning   = data[:meaning]
        phr.spelling  = data[:spelling]
      end
    end

    private

    attr_reader :data, :recipient_uid
  end
end
