class IncreaseOriginalUrlLimit < ActiveRecord::Migration[5.2]
  def change
    change_column :shortened_urls, :original_url, :string, limit: 1000
  end
end
