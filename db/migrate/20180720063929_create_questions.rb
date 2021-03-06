# frozen_string_literal: true

class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :content
      t.text :answer

      t.timestamps
    end
  end
end
