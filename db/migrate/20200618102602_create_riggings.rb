class CreateRiggings < ActiveRecord::Migration[6.0]
  def change
    create_table :riggings do |t|
      t.string :rigging

      t.timestamps
    end
  end
end
