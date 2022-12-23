# frozen_string_literal: true

class Record < ApplicationRecord
  has_one_attached :photo
  has_many :comments, dependent: :destroy
  validates :title, presence: true, length: { maximum: 30 }
  validates :photo, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :status, presence: true
end
