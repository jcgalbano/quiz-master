# frozen_string_literal: true

class Question < ApplicationRecord
  validates :content, presence: true
  validates :answer, presence: true

  belongs_to :quiz
end