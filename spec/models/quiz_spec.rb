# frozen_string_literal: true

require 'rails_helper'

describe Quiz, type: :model do
  # testing CRUD and assumptions
  context 'on create' do
    quiz_test = FactoryBot.create(:quiz)
    it 'has a valid factory' do
      expect(quiz_test).to be_valid
    end
    it 'returns title as a string' do
      expect(quiz_test.title.class).to eq(String)
    end
    it 'can be updated' do
      update_title = 'this is the new title'
      quiz_test.update(title: update_title)

      expect(quiz_test.reload.title).to eq(update_title)
    end
    it 'can be destroyed' do
      quiz_test.destroy
      expect(Quiz.exists?(quiz_test.id)).to eq(false)
    end
  end

  # testing validations
  it 'is invalid without a title' do
    quiz_test = FactoryBot.build(:quiz, title: nil)
    expect(quiz_test).not_to be_valid
  end

  # testing associations
  it { should belong_to :course }
  it { should have_many :questions }
end
