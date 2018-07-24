# frozen_string_literal: true

class Question < ApplicationRecord
  validates :content, presence: true
  validates :answer, presence: true

  belongs_to :user
  belongs_to :quiz

  # queries the next record on the same quiz given the quid_id association
  def next(quiz_id)
    self.class.where('quiz_id = ?', quiz_id).where('id > ?', id).first
  end

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
end
