# frozen_string_literal: true

module TermServices
  class Randomizer
    TWO_POW_63 = 9223372036854775808

    attr_reader :term

    def initialize
      @random_number = rand(TWO_POW_63)
    end

    def call
      shuffle_upside    = Term.shuffle_up(random_number)
      shuffle_downside  = Term.shuffle_down(random_number)
      @term = [*shuffle_upside, *shuffle_downside].sample
    end

    private

    attr_reader :random_number

    class << self
      def call
        service = new
        service.call
        service
      end
    end
  end
end
