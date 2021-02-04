class MakeChanges < ActiveRecord::Migration[5.2]
  def change
    # can not migrate
    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :username, :string, default: false
  end

    add_index :users, :username, unique: true
end
