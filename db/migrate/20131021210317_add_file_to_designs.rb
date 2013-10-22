class AddFileToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :file, :string
  end
end
