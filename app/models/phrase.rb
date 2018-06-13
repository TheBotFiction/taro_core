# frozen_string_literal: true

class Phrase < ApplicationRecord
  include Shufflable

  belongs_to :recipient
end
