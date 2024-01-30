FactoryBot.define do
  factory :profile do
    user
    username { "test username" }
    display_name { nil }
    description { "test description" }
  end
end
