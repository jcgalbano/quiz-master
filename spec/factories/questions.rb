# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :question do |f|
    f.content { Faker::Lorem.characters }
    f.answer { Faker::Lorem.characters }
    f.association :user, factory: :user
    f.association :quiz, factory: :quiz
  end
end
