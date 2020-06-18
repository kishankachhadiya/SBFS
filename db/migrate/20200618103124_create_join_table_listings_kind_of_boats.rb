class CreateJoinTableListingsKindOfBoats < ActiveRecord::Migration[6.0]
  def change
    create_join_table :listings, :kind_of_boats do |t|
      t.index :listing_id
      t.index :kind_of_boat_id
    end
  end
end
