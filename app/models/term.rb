# frozen_string_literal: true

class Term < ApplicationRecord
  include Shufflable

  class << self
    # Given a term and find a set of similarity terms
    #
    # @param term [Term] A record of Term
    # @return [Array<Term>] An array of 1-5 similar term
    def find_similarity(term)
      service = TermServices::Similarizer.new(term)
      service.call
      service.results.values.flatten.sample(5)
    end

    def find_random
      service = TermServices::Randomizer.call
      service.term
    end

    def shuffle_up(random_number, limit: 5)
      where(arel_table[:shuffling].gt(random_number))
        .order(shuffling: :asc).limit(limit)
    end

    def shuffle_down(random_number, limit: 5)
      where(arel_table[:shuffling].lteq(random_number))
        .order(shuffling: :desc).limit(limit)
    end
  end
end
