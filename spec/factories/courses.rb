# frozen_string_literal: true

FactoryBot.define do
  factory :course do |f|
    f.title { Faker::String.random }
  end
end
