class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.string :name     
      t.integer :recipe_category_id
      t.timestamps
    end
    add_index :recipes, :recipe_category_id
    add_foreign_key :recipes, :recipe_categories

  end
end
