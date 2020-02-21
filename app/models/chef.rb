class Chef <ApplicationRecord
  validates_presence_of :name
  has_many :dishes

  def list_ingredients
    Ingredient
    .joins(:chefs)
    .where("item.chef_id = ?" self.id)
    .pluck(:name)

    Ingredient.joins(:chefs).joins(dishes).where("dish.chef_id = ?" self.id).pluck(:name)
    binding.pry
    Dish.join.(:ingredients)
    dishes.map do |dish|
      dish.ingredients
    end
  end
end
