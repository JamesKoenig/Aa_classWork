class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string      :title,      null: false
      t.text        :body,       null: false
      t.integer     :author_id,  null: false
      t.integer     :section_id, null: false

      t.index [:title,:author_id], unique: true

      t.timestamps
    end
  end
end
