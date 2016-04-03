class CreateStakeholders < ActiveRecord::Migration
  def change
    create_table :stakeholders do |t|
      t.text :name
      t.integer :worksheet_id

      t.timestamps null: false
    end
  end
end
