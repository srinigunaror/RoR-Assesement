# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.integer :status, default: 1
      t.date :completed_date
      t.references :assigned_to, index: true
      t.integer :priority
      t.integer :progess_percentage
      t.timestamps
    end
  end
end
