class UpdateToArtUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :name, :username
      t.remove :email
    end
  end
end
