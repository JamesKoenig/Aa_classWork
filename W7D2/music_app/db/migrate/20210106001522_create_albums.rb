class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :year, null: false
      t.integer :band_id, null: false
      t.boolean :live, null: false, default: false #opposite = studio
      t.timestamps
    end
    add_index :albums, %i(band_id title), unique: true #a band has to have unique album names, but multiple bands can have the same album name
    #%i = array of symbols
  end
end
