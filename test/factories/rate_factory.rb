# frozen_string_literal: true

FactoryBot.define do
  factory :rate do
    association :base, factory: :currency
    association :target, factory: :currency

    amount { Faker::Number.decimal(l_digits: 3, r_digits: 3) }
  end
end
