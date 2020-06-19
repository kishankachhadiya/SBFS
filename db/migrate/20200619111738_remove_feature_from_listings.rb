class RemoveFeatureFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :featured, :boolean
  end
end
