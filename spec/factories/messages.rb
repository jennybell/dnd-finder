FactoryBot.define do
  factory :message do
    content { "MyText" }
    user { nil }
    group { nil }
  end
end
