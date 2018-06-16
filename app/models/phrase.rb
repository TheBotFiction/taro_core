# frozen_string_literal: true

class Phrase < ApplicationRecord
  include Shufflable

  belongs_to :recipient

  after_commit :analyze_and_store_term, on: :create

  private

  def analyze_and_store_term
    analyzer = PhraseAnalyzer.new(self.term)
    analyzer.call
    analyzer.terms&.each do |term|
      Term.find_or_create_by(term: term[:term], spelling: term[:spelling])
    end
  end
end
