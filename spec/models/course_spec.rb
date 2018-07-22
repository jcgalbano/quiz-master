# frozen_string_literal: true

require 'rails_helper'

describe Course, type: :model do # testing CRUD and assumptions
  context 'on create' do
    course_test = FactoryBot.create(:course)
    it 'has a valid factory' do
      expect(course_test).to be_valid
    end
    it 'returns title as a string' do
      expect(course_test.title.class).to eq(String)
    end
    it 'can be updated' do
      update_title = 'this is the new title'
      course_test.update(title: update_title)

      expect(course_test.reload.title).to eq(update_title)
    end
    it 'can be destroyed' do
      course_test.destroy
      expect(Course.exists?(course_test.id)).to eq(false)
    end
  end

  # testing validations
  it 'is not valid without a title' do
    course_text = FactoryBot.build(:course, title: nil)
    expect(course_text).not_to be_valid
  end

  # testing associations
  it { should belong_to(:user) }
  it { should have_many(:quizzes) }
end
