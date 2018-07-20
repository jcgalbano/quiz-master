# frozen_string_literal: true

require 'faker'

FactoryBot.define do
  factory :question do |f|
    f.content { Faker::Lorem.characters }
    f.answer { Faker::Lorem.characters }
  end
end
