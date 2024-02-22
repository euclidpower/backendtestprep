# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    api_key { SecureRandom.hex 16 }
  end
end
