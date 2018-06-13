# frozen_string_literal: true

FactoryBot.define do
  factory :phrase do
    recipient

    term "MyString"
    meaning "MyString"
    spelling "MyString"
    gid nil
    shuffling nil
  end
end
