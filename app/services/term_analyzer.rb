# frozen_string_literal: true

require "yahoo-japanese-analysis"

class TermAnalyzer
  attr_reader :term

  def initialize(term:, analyzer: :morpheme)
    @term = term
    case analyzer
    when :morpheme
      @analyzer = :morpheme_analyze
    when :dependency
      @analyzer = :dependency_analyze
    else
      @analyzer = :morpheme_analyze
    end
  end

  def call
    send analyzer
  end

  private

  attr_reader :analyzer

  def client
    return @client if @client
    @client = YahooJA::Client.new

    @client.configure do |config|
      config.app_key = Rails.application.credentials.dig(Rails.env.to_sym, :yahoo, :client_id)
    end
    @client
  end

  def dependency_analyze
    result = client.kakari_uke term
    return unless result
    dependencies = result.dig :Result, :ChunkList, :Chunk
    return unless dependencies
    dependencies = [dependencies] unless dependencies.is_a?(Array)

    [*dependencies].map { |data_set| dependency_analyze_each_one(data_set) }.flatten
  end

  def dependency_analyze_each_one(result)
    data_set = result.dig :MorphemList, :Morphem
    return unless data_set
    data_set = [data_set] unless data_set.is_a?(Array)

    [*data_set].map do |word_data|
      {
        term:     word_data[:Baseform],
        spelling: word_data[:Reading],
        surface:  word_data[:Surface]
      }
    end
  end

  def morpheme_analyze
    result = client.morpheme_analysis(term, {
      results:  "ma",
      response: "surface,reading,baseform",
      filter:   "1|2|3|4|5|6|7|8|9|10"
    })
    return unless result
    word_list = result.dig :ma_result, :word_list, :word
    return unless word_list
    word_list.map do |word|
      {
        term:     word[:baseform],
        spelling: word[:reading],
        surface:  word[:surface]
      }
    end
  end
end
