# frozen_string_literal: true

class Recipient < ApplicationRecord
  has_one_attached :avatar
end
