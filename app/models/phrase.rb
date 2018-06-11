# frozen_string_literal: true

class Phrase < ApplicationRecord
  TWO_POW_63 = 9223372036854775808

  belongs_to :recipient

  before_save :shuffle_it

  private

  def shuffle_it
    self.shuffling = rand(TWO_POW_63)
  end
end
