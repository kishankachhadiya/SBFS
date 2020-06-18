class CreateJoinTableListingsRiggings < ActiveRecord::Migration[6.0]
  def change
    create_join_table :listings, :riggings do |t|
      t.index :listing_id
      t.index :rigging_id
    end
  end
end
