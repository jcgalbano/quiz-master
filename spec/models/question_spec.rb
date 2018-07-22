# frozen_string_literal: true

require 'rails_helper'

describe Question, type: :model do
  # testing CRUD and assumptions
  context 'on create' do
    quest_test = FactoryBot.create(:question)
    it 'has a valid factory' do
      expect(quest_test).to be_valid
    end
    it 'returns content as a string' do
      expect(quest_test.content.class).to eq(String)
    end
    it 'returns an answer as a string' do
      expect(quest_test.answer.class).to eq(String)
    end
    it 'can be updated' do
      update_content = 'this is the new content'
      quest_test.update(content: update_content)

      expect(quest_test.reload.content).to eq(update_content)
    end
    it 'can be destroyed' do
      quest_test.destroy
      expect(Question.exists?(quest_test.id)).to eq(false)
    end
  end

  # testing validations
  it 'is invalid without a content' do
    quest_test = FactoryBot.build(:question, content: nil)
    expect(quest_test).not_to be_valid
  end
  it 'is invalid without an answer' do
    quest_test = FactoryBot.build(:question, answer: nil)
    expect(quest_test).not_to be_valid
  end

  # testing associations
  it { should belong_to(:quiz) }
end
