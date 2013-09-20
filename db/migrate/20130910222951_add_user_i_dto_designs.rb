class AddUserIDtoDesigns < ActiveRecord::Migration
  def up
    add_column :designs, :user_id, :integer
  end

  def down
    remove_column :designs, :user_id
  end
end
