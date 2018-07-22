# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :quizzes
end
