# frozen_string_literal: true

class Quiz < ApplicationRecord
  # make rails_admin associate the current_user's id to the models
  rails_admin do
    edit do
      field :user_id, :hidden do
        default_value do
          bindings[:view]._current_user.id
        end
      end
    end
  end

  # validations
  validates :title, presence: true

  # associations
  belongs_to :user
  belongs_to :course
  has_many :questions
end
