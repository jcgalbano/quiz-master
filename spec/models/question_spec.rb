# frozen_string_literal: true

require 'rails_helper'

describe Question, type: :model do
  it 'has a valid factory' do
    quest_test = FactoryBot.create(:question)
    expect(quest_test).to be_valid
  end
  it 'is invalid without a content' do
    quest_test = FactoryBot.build(:question, content: nil)
    expect(quest_test).not_to be_valid
  end
  it 'is invalid without an answer' do
    quest_test = FactoryBot.build(:question, answer: nil)
    expect(quest_test).not_to be_valid
  end
  it { should belong_to(:quiz) }
end
