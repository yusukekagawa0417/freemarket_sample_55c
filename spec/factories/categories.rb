FactoryBot.define do
  factory :category do
    sequence(:name) {Faker::Name.name}
    ancestry    {"1/20"}
  end
end