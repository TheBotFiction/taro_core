# frozen_string_literal: true

FactoryBot.define do
  factory :phrase do
    recipient

    term "虎穴に入らずんば虎子を得ず"
    meaning "If you do not enter the tiger’s cave, you will not catch its cub."
    spelling "MyString"
    gid nil
    shuffling nil
  end
end
