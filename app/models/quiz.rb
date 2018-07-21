# frozen_string_literal: true

class Quiz < ApplicationRecord
  validates :title, presence: true

  belongs_to :course
  has_many :questions
end
