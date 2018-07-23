# frozen_string_literal: true

class Course < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  has_many :quizzes

  rails_admin do
    edit do
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end
end
