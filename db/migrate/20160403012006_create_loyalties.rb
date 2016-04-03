class CreateLoyalties < ActiveRecord::Migration
  def change
    create_table :loyalties do |t|
      t.text :content
      t.integer :stakeholder_id

      t.timestamps null: false
    end
  end
end
