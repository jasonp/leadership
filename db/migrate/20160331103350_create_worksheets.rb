class CreateWorksheets < ActiveRecord::Migration
  def change
    create_table :worksheets do |t|
      t.text :change_needed
      t.string :temporary_worksheet_code

      t.timestamps null: false
    end
  end
end
