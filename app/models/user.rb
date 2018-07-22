# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :courses
end
