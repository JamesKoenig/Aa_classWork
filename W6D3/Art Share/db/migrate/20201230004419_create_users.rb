class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string     :name,  null: false, index: true
      t.string     :email, null: false, index: true
      t.timestamps
    end
  end
end
