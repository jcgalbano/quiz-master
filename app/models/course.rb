# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true

  has_many :quizzes
end
