FactoryBot.define do
  factory :brand do
    sequence(:name) {Faker::Name.name}
  end
end