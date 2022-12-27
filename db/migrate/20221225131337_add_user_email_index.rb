# frozen_string_literal: true

class AddUserEmailIndex < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :email
  end
end
