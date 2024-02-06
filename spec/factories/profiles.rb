FactoryBot.define do
  factory :profile do
    user
    username { "test username" }
    display_name { "test display name" }
    about { "test about" }
    specialties { [] }
  end

  trait :with_specialties do
    specialties { ["one", "two"] }
  end
end
