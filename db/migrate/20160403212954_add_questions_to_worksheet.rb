class AddQuestionsToWorksheet < ActiveRecord::Migration
  def change
    add_column :worksheets, :elephant1, :integer
    add_column :worksheets, :elephant2, :integer
    add_column :worksheets, :responsible1, :string
    add_column :worksheets, :responsible2, :string
    add_column :worksheets, :independent1, :string
    add_column :worksheets, :independent2, :string
    add_column :worksheets, :develop1, :string
    add_column :worksheets, :develop2, :string
    add_column :worksheets, :reflection1, :string
    add_column :worksheets, :reflection2, :string
    add_column :worksheets, :antifragile, :integer
    add_column :worksheets, :permission_to_contact, :string
    add_column :worksheets, :email, :text
  end
end
