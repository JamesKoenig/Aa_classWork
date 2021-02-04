class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      #t.data_type :column_name, options={}
      t.string :email, null: false #db constraints 
      t.string :username, null: false 
      t.timestamps #created_at, updated_at timestamps 
    end

    #add_index :table_name, :column_name, options={}

    #index creates a binary search type data structure for this column
    #indexing speeds up lookup time- add to columns you will search by 
    #don't unnecessarily add_index -> can be costly 
    #add_index != primary key: rails generates the latter 

    add_index :users, :username, unique: true 
    add_index :users, :email, unique: true 

    #unique: true only works if you add_index 
    #rails won't do it if you don't speed up the search time 
 

  end
end
