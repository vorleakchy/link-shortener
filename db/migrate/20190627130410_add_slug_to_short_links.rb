class AddSlugToShortLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :short_links, :slug, :string, limit: 10, null: false
    add_index :short_links, :slug, unique: true
  end
end
