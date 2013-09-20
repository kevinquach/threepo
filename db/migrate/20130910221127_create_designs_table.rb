class CreateDesignsTable < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.text :description, null: false

      t.timestamps
    end
  end
end
