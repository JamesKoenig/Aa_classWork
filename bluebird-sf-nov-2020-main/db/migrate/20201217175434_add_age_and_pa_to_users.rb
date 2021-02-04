class AddAgeAndPaToUsers < ActiveRecord::Migration[5.2]
  def change
    #method :table_name, :column_name, :data_type, options={}
    add_column :users, :political_affiliation, :string, null: false
    add_column :users, :age, :integer, null: false 
    add_index :users, :political_affiliation #doesn't need to be unique
  end
end
