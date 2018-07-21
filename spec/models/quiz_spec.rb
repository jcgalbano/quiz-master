# frozen_string_literal: true

require 'rails_helper'

describe Quiz, type: :model do
  it 'has a valid factory' do
    quiz_test = FactoryBot.create(:quiz)
    expect(quiz_test).to be_valid
  end
  it 'is invalid without a title' do
    quiz_test = FactoryBot.build(:quiz, title: nil)
    expect(quiz_test).not_to be_valid
  end
end
