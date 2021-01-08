class SectionsAddUniqueToTitles < ActiveRecord::Migration[5.0]
  def change
    change_column_null :sections, :title, false
  end
end
