# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :question do |f|
    f.content { Faker::Lorem.characters.delete("\000") }
    f.answer { Faker::Lorem.characters.delete("\000") }
    f.association :user, factory: :user
    f.association :quiz, factory: :quiz
  end
end
