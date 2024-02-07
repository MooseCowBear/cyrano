FactoryBot.define do
  factory :product do
    title { "title" }
    description { "product description" }
    price { 10 }
    association :writer, factory: :user
  end
end
