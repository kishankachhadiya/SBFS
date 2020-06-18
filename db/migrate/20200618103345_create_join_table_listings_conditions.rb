class CreateJoinTableListingsConditions < ActiveRecord::Migration[6.0]
  def change
    create_join_table :listings, :conditions do |t|
      t.index :listing_id
      t.index :condition_id
    end
  end
end
