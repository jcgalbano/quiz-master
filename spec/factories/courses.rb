# frozen_string_literal: true

FactoryBot.define do
  factory :course do |f|
    f.title { Faker::String.random }
    f.association :user, factory: :user
  end
end
