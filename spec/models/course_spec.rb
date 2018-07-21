# frozen_string_literal: true

require 'rails_helper'

describe Course, type: :model do
  it 'has a valid factory' do
    course_test = FactoryBot.create(:course)
    expect(course_test).to be_valid
  end
  it 'is not valid without a title' do
    course_text = FactoryBot.build(:course, title: nil)
    expect(course_text).not_to be_valid
  end
end
