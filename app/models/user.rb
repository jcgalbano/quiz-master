# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # has_secure_password
  enum role: %i[user admin]
  after_initialize :set_default_role, if: :new_record?

  # sets the default role to be user
  # if it was not explicitly set
  def set_default_role
    self.role ||= :user
  end

  # validations
  validates :user_name, uniqueness: true
  validates :user_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # associations
  has_many :courses
end
