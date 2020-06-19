class RemoveFeaturedFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :feature, :boolean
  end
end
