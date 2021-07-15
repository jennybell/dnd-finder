FactoryBot.define do
  factory :invitation do
    sender { nil }
    receiver { nil }
    confirmed { false }
  end
end
