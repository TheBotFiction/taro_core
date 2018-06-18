# frozen_string_literal: true

class Phrase < ApplicationRecord
  include Shufflable

  belongs_to :recipient
  has_and_belongs_to_many :terms

  after_commit :analyze_and_store_term, on: :create

  private

  def analyze_and_store_term
    analyzer = PhraseAnalyzer.new(self.term)
    analyzer.call
    analyzer.terms&.each do |term|
      created_term = Term.find_or_create_by(term: term[:term], spelling: term[:spelling])
      link_phrase_to_term(created_term)
    end
  end

  def link_phrase_to_term(term)
    return if self.terms.exists?(id: term.id)
    self.terms << term
  end
end
