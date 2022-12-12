# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :record
  validates :username, presence: true
  validates :cost, presence: true
end
