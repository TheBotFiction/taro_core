# frozen_string_literal: true

module Shufflable
  extend ActiveSupport::Concern

  included do
    TWO_POW_63 = 9223372036854775808

    before_save :shuffle_it
  end

  private

  def shuffle_it
    self.shuffling = rand(TWO_POW_63)
  end

  class_methods do
  end
end
