class AddFeatureToListings < ActiveRecord::Migration[6.0]
  def change
    add_column :listings, :feature, :boolean
  end
end
