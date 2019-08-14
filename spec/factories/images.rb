FactoryBot.define do
  factory :image do 
    image {File.open("#{Rails.root}/public/uploads/image/image/1/IMG_0058.jpeg")}
    association :item
  end
end