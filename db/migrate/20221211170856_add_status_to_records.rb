# frozen_string_literal: true

class AddStatusToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :status, :string
  end
end
