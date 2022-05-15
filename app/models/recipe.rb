class Recipe < ApplicationRecord
  validates :name, presence: { message: 'Name must not be blank!' }
  validates :description, presence: { message: 'Description must not be blank!' }
  belongs_to :recipe_category
  has_many :recipe_ingredients, dependent: :destroy
end
