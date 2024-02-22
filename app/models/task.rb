# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :assigned_to, class_name: 'User', optional: true

  enum status: { started: 1, in_progress: 2, completed: 3 }
  enum priority: { High: 1, Low: 2, Medium: 3 }

  validates_presence_of :title, :description, :due_date

  before_save :update_completed_date, if: ->(obj) { obj.completed? }

  scope :completed_between, -> (start_date, end_date) { where("completed_date between ? and ?", start_date, end_date) } 

  private

  def update_completed_date
    self.completed_date = Date.today
  end
end
