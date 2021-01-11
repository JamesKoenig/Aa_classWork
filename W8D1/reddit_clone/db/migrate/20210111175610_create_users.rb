class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table    :users do |t|
      t.string      :username,        nil: false, index: { unique: true }
      t.string      :session_token,   nil: false, index: { unique: true }
      t.string      :password_digest, nil: false
      t.timestamps
    end
  end
end
