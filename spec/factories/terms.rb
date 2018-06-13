# frozen_string_literal: true

FactoryBot.define do
  factory :term do
    term "MyString"
    meaning "MyString"
    spelling "MyString"
    gid 1
    level "L1"
    shuffling nil
  end
end
