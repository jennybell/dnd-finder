FactoryBot.define do
  factory :game do
    name { "Test" }
    date { "2021-07-15" }
    time { "2021-07-15 14:10:30" }
    location { "Makers Academy" }
    group { nil }
  end
end
