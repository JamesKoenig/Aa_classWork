class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table    :posts do |t|
      t.string      :subject
      t.text        :body,    nil: false
      t.boolean     :edited,  default: false
      t.integer     :user_id, nil: false, index: true
      t.integer     :sub_id,  nil: false, index: true

      t.timestamps
    end
  end
end
