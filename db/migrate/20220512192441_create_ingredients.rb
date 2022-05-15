class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|     
      t.string :name
      t.string :measurement_unit
      t.float :unit_price
      t.float :unit_quantity
      t.timestamps
    end
  end
end