class CreateChirps < ActiveRecord::Migration[5.2]
  def change
    create_table :chirps do |t|
      t.text :body, null: false 
      t.integer :author_id, null: false 
      #foreign key that will be a user 
      t.timestamps 
    end

    #index foreign keys 
    add_index :chirps, :author_id 
    #no need to be unique- otherwise each user can only write one chirp
  end
end
#this is a migration file 
#don't edit a migration that has been migrated 
#or delete... 
