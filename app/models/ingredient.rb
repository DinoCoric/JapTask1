class Ingredient < ApplicationRecord
  validates :name, presence: { message: 'Name must not be blank!' }
  validates :measurement_unit, presence: { message: 'Measurement must not be blank!' }
  validates :unit_quantity,
            numericality: { message: 'The unit quantity should be greater or equal to 1', only_float: true,
                            greater_than_or_equal_to: 1 }
  validates :unit_price,
            numericality: { message: 'The unit price should be greater or equal to 1', only_float: true,
                                            greater_than_or_equal_to: 1 } 
  has_many :recipe_ingredients, dependent: :destroy 
end
