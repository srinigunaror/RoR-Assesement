# frozen_string_literal: true

class User < ApplicationRecord
  has_many :tasks, dependent: :destroy, foreign_key: 'assigned_to_id'
end
