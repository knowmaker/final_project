# frozen_string_literal: true

class UpdateStatusDefaultToNewRecords < ActiveRecord::Migration[7.0]
  def change
    change_column_default :records, :status, from: nil, to: 'Создано'
  end
end
