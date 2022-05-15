class RecipeCategory < ApplicationRecord
  validates :name, presence: { message: 'Name must not be blank!' }
end
