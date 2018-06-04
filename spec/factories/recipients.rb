FactoryBot.define do
  factory :recipient do
    uid SecureRandom.uuid
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    raw_data ""
  end
end
