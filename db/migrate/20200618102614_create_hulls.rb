class CreateHulls < ActiveRecord::Migration[6.0]
  def change
    create_table :hulls do |t|
      t.string :hull

      t.timestamps
    end
  end
end
