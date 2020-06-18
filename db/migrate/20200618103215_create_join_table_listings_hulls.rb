class CreateJoinTableListingsHulls < ActiveRecord::Migration[6.0]
  def change
    create_join_table :listings, :hulls do |t|
      t.index :listing_id
      t.index :hull_id
    end
  end
end
