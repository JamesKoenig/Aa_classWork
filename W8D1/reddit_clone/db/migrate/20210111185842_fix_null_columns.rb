class FixNullColumns < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :username,        :string,  null: false
    change_column :users, :session_token,   :string,  null: false 
    change_column :users, :password_digest, :string,  null: false
    change_column :posts, :body,            :text,    null: false 
    change_column :posts, :user_id,         :integer, null: false
    change_column :posts, :sub_id,          :integer, null: false
    change_column :subs,  :name,            :string,  null: false
  end
end
