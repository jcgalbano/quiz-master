# frozen_string_literal: true

class AddCourseIdToQuizzes < ActiveRecord::Migration[5.1]
  def change
    add_column :quizzes, :course_id, :integer
  end
end
