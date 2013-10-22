class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.integer :design_id

      t.timestamps
    end

    add_index :comments, :design_id
  end
end
