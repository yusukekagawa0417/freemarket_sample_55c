FactoryBot.define do
  factory :category do
    sequence(:name) {Faker::Internet.name}
  end
end