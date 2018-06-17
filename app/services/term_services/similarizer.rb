# frozen_string_literal: true

module TermServices
  class Similarizer
    TWO_POW_63 = 9223372036854775808

    attr_reader :seed, :results

    def initialize(seed_term, limit: 5)
      @seed           = seed_term
      @limit          = limit
      @random_number  = rand(TWO_POW_63)
    end

    def call
      terms = [
        *shuffle_upside(term_seed_queries, :term),
        *shuffle_downside(term_seed_queries, :term)
      ].sample(limit)
      spells = [
        *shuffle_upside(spell_seed_queries, :spelling),
        *shuffle_downside(spell_seed_queries, :spelling)
      ].sample(limit)
      @results = {
        terms: terms,
        spells: spells
      }
    end

    private

    attr_reader :random_number, :limit

    def term_seed_queries
      return @term_seed_queries if @term_seed_queries
      term_seed = seed.term.scan(/\p{Han}/)
      @term_seed_queries = []
      term_seed.length.downto(1).each do |seed_length|
        posibilities = term_seed.combination(seed_length)
        posibilities.each do |posibility|
          @term_seed_queries.push("%#{posibility.join}%")
        end
      end
      @term_seed_queries
    end

    def spell_seed_queries
      return @spell_seed_queries if @spell_seed_queries
      @spell_seed_queries = ["%#{seed.spelling}%"]
      if seed.spelling.length > 2
        (2..seed.spelling.length).each do |last_pos|
          @spell_seed_queries.push("%#{seed.spelling[0..last_pos]}")
        end
      end
      @spell_seed_queries
    end

    def shuffle_upside(queries, column)
      return [] if queries.empty?
      Term.shuffle_up(random_number, limit: limit)
        .where Term.arel_table[column].matches_any(queries)
    end

    def shuffle_downside(queries, column)
      return [] if queries.empty?
      Term.shuffle_down(random_number, limit: limit)
        .where Term.arel_table[column].matches_any(queries)
    end
  end
end
