# frozen_string_literal: true

class Quiz < ApplicationRecord
  validates :title, presence: true

  belongs_to :user
  belongs_to :course
  has_many :questions

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
