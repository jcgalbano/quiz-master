# frozen_string_literal: true

class AddUserIdToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :user_id, :integer
  end
end