# frozen_string_literal: true

module Shufflable
  extend ActiveSupport::Concern

  TWO_POW_63 = 9223372036854775808

  included do
    before_save :shuffle_it
  end

  private

  def shuffle_it
    self.shuffling = rand(TWO_POW_63)
  end
end
