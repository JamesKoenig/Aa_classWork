class CreateModerators < ActiveRecord::Migration[5.2]
  def change
    create_table :moderators do |t|
      t.integer :moderator_id,          null: false
      t.integer :sub_id,                null: false
      t.index [:moderator_id, :sub_id], unique: true
      
      t.timestamps
    end
  end
end
