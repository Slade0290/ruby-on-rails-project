class CreateCarsDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :cars_details do |t|
      t.string :Rate
      t.string :Avis
      t.references :cars, null: false, foreign_key: true

      t.timestamps
    end
  end
end
