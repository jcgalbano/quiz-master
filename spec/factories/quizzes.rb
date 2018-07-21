# frozen_string_literal: true

FactoryBot.define do
  factory :quiz do |f|
    f.title { Faker::String.random }
    f.association :course, factory: :course
  end
end
