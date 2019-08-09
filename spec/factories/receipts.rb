FactoryBot.define do

  factory :receipt do
    item_id    {1}
    buyer_id   {1}
    seller_id  {1}
    association :item
    association :seller, factory: :user
    association :buyer, factory: :user
  end
end
