# frozen_string_literal: true

class AddDateToRecords < ActiveRecord::Migration[7.0]
  def change
    add_column :records, :timeend, :datetime
  end
end
