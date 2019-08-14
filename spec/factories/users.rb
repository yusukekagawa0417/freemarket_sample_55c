FactoryBot.define do
  factory :user do
    sequence(:email) {Faker::Internet.email}
    password         {"password"}
    nickname         {"test"}
    firstname        {"ああああ"}
    lastname         {"いいいい"}
    firstname_kana   {"アアアア"}
    lastname_kana    {"イイイイ"}
    birthday         {"1990-01-01"}
    sequence(:tel)   {Faker::Number.number(digits:11)}
    customer         {"aaaaaaaaaaa"}
    card             {"aaaaaaaaaaa"}
  end
end