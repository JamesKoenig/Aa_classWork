class CreateSubs < ActiveRecord::Migration[5.2]
  def change
    create_table :subs do |t|
      t.string      :name,    nil: false, index: { unique: true }
      t.string      :description 
      t.timestamps
    end
  end
end
