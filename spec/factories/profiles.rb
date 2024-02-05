FactoryBot.define do
  factory :profile do
    user
    username { "test username" }
    display_name { "" }
    about { "test about" }
  end
end
