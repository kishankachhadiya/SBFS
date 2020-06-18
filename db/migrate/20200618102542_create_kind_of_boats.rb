class CreateKindOfBoats < ActiveRecord::Migration[6.0]
  def change
    create_table :kind_of_boats do |t|
      t.string :kind

      t.timestamps
    end
  end
end
