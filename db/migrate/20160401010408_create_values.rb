class CreateValues < ActiveRecord::Migration
  def change
    create_table :values do |t|
      t.integer :worksheet_id
      t.text :content
      t.string :temporary_worksheet_code

      t.timestamps null: false
    end
  end
end
