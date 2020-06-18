class CreateJoinTableListingsManufacturers < ActiveRecord::Migration[6.0]
  def change
    create_join_table :listings, :manufacturers do |t|
      t.index :listing_id
      t.index :manufacturer_id
    end
  end
end
