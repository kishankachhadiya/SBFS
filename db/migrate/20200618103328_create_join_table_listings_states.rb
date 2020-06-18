class CreateJoinTableListingsStates < ActiveRecord::Migration[6.0]
  def change
    create_join_table :listings, :states do |t|
      t.index :listing_id
      t.index :state_id
    end
  end
end
