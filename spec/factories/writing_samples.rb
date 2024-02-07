FactoryBot.define do
  factory :writing_sample do
    association :writer, factory: :user
    body { "body" }
    title { "title" }
    tags { [] }
  end
end
