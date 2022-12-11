class CreateRecords < ActiveRecord::Migration[7.0]
  def change
    create_table :records do |t|
      t.string :title
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
