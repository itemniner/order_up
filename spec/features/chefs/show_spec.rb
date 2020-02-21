require "rails_helper"

RSpec.describe "on the show page" do
  describe "as a visitor" do
    it "see name of chef and link to see all ingredients the chef uses" do
      chef = Chef.create(name: "Boy Arty")
      spag = Dish.create(name: "spag hedy", description: "hard stuff", chef_id: chef.id)
      noodles = Ingredient.create(name: "noodles", calories: 100)
      sauce = Ingredient.create(name: "meat sauce", calories: 300)
      DishIngredient.create(dish: spag, ingredient: noodles)
      DishIngredient.create(dish: spag, ingredient: sauce)

      good = Dish.create(name: "spag hedy", description: "hard stuff", chef_id: chef.id)
      rice = Ingredient.create(name: "rice", calories: 100)
      chicken = Ingredient.create(name: "chicken", calories: 100)
      DishIngredient.create(dish: good, ingredient: rice)
      DishIngredient.create(dish: good, ingredient: chicken)

      chef_2 = Chef.create(name: "Gordan Rimsy")
      steak = Dish.create(name: "steak", description: "yum", chef_id: chef_2.id)
      meat = Ingredient.create(name: "meat", calories: 200)
      DishIngredient.create(dish: steak, ingredient: meat)
      
      visit "/chefs/#{chef.id}"

      click_on "Chef's ingredients"

      expect(current_path).to eq("/chefs/#{chef.id}/ingredients")
      expect(page).to have_content(noodles.name)
      expect(page).to have_content(sauce.name)
      expect(page).to have_content(rice.name)
      expect(page).to have_content(chicken.name)
      expect(page).to_not have_content(meat.name)
    end
  end
end

