class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      #joins table for many-many relationships 
      t.integer :liker_id, null: false
      t.integer :chirp_id, null: false 

      t.timestamps #rails g model Like gave us this 
    end
    add_index :likes, :liker_id 
    # add_index :likes, :chirp_id 
    add_index :likes, [:chirp_id, :liker_id], unique: true 
    #make the combo unique 
    #the first argument in the combo will be given an add_index. we don't need to write it again 
  end
end
