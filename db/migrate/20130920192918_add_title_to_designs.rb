class AddTitleToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :title, :string, null: false
  end
end
