class M::Term < ApplicationRecord
  TWO_POW_63 = 9223372036854775808

  before_save :shuffle_it

  private

  def shuffle_it
    self.shuffling = rand(TWO_POW_63)
  end
end
