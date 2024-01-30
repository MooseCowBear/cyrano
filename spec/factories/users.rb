FactoryBot.define do
  factory :user do
    sequence(:email, 100) { |n| "person#{n}@example.com" }
    password { "123456" }
    writer { true }
  end
end
