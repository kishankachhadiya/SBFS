class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.text :equipment
      t.string :model
      t.integer :length
      t.integer :beam
      t.integer :draft
      t.integer :displacement
      t.integer :year
      t.integer :cabins
      t.integer :berths
      t.string :engine
      t.string :fuel
      t.integer :hours
      t.integer :horsepower
      t.string :location
      t.integer :zip_code
      t.string :public_name
      t.string :email
      t.string :phone_number
      t.date :published

      t.timestamps
    end
  end
end
