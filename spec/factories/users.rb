# frozen_string_literal: true

FactoryBot.define do
  factory :user do |f|
    f.user_name { Faker::String.random }
    f.email { Faker::Internet.email }
    # strictly generate only 1 password for matching
    # password and password_confirmatino field
    pass = Faker::String.random
    f.password { pass }
    f.password_confirmation { pass }
  end
end
