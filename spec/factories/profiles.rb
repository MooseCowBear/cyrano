FactoryBot.define do
  factory :profile do
    user 
    username { "test username" }
    description { "test description" }
  end
end
