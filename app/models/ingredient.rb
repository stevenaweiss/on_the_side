class Ingredient < ActiveRecord::Base
  has_many :restaurants
end
