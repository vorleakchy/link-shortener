class AddExpiresAtToShortLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :short_links, :expires_at, :datetime
  end
end
