require "rails_helper"

RSpec.describe "on the show page" do
  describe "as a visitor" do
    it "can see the name of the chef and ingredients" do
      chef = Chef.create(name: "Boy Arty")
      dish = Dish.create(name: "spag hedy", description: "hard stuff", chef_id: chef.id)
      noodles = Ingredient.create(name: "noodles", calories: 100)
      sauce = Ingredient.create(name: "meat sauce", calories: 300)
      DishIngredient.create(dish: dish, ingredient: noodles)
      DishIngredient.create(dish: dish, ingredient: sauce)

      visit "/dishes/#{dish.id}"

      expect(page).to have_content(chef.name)
      expect(page).to have_content(noodles.name)
      expect(page).to have_content(sauce.name)
    end

    it "can see total calories count for that dish" do
      chef = Chef.create(name: "Boy Arty")
      dish = Dish.create(name: "spag hedy", description: "hard stuff", chef_id: chef.id)
      noodles = Ingredient.create(name: "noodles", calories: 100)
      sauce = Ingredient.create(name: "meat sauce", calories: 300)
      DishIngredient.create(dish: dish, ingredient: noodles)
      DishIngredient.create(dish: dish, ingredient: sauce)
      
      visit "/dishes/#{dish.id}"
      
      expect(page).to have_content("total calories: 400")
      expect(dish.total_calories).to eq(400)
    end
  end
end