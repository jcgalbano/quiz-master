# frozen_string_literal: true

FactoryBot.define do
  factory :quiz do |f|
    f.title { Faker::String.random.delete("\000") }
    f.association :user, factory: :user
    f.association :course, factory: :course
  end
end
