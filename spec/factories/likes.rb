FactoryBot.define do

  factory :like do
    item_id    {1}
    user_id   {1}
    association :item
    association :user
  end
  
end
