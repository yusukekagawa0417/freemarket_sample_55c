FactoryBot.define do
  factory :address do
    id                {"1"}
    postal_code       {"000-0000"}
    prefecture_id     {"1"}
    city              {"横浜市緑区"}
    address_number    {"青山1-1-1"}
    user_id           {"1"}
  end
end