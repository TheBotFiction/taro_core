# frozen_string_literal: true

class MasterTermImporter
  END_WORD_DELIMITER = /[\W]+$/

  def initialize(file_path, level = nil)
    @file_path  = file_path
    @level      = level
  end

  def call
    data = JSON.load(File.read @file_path)
    data.each { |word| potential_create_term_by(word) }
    true
  end

  private

  def potential_create_term_by(word)
    M::Term.find_or_create_by(term: word["word"].strip) do |term|
      term.meaning  = word["mean"].sub(END_WORD_DELIMITER, "")
      term.spelling = word["phonetic"]
      term.gid      = word["group"].to_i
      term.level    = @level
    end
    nil
  end
end
