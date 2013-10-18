class AddImageToDesigns < ActiveRecord::Migration
  def change
    add_column :designs, :image, :string
  end
end
