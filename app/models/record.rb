# frozen_string_literal: true

class Record < ApplicationRecord
  has_one_attached :photo
  has_many :comments, dependent: :destroy
end
