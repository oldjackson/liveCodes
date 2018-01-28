require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(csv_path)
    @csv_path = csv_path
    @recipes = []
    load_csv
  end

  def all
    @recipes
  end

  def add(recipe)
    @recipes << recipe
    save_csv
  end

  def remove(index)
    @recipes.delete_at(index)
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_path) do |row|
      @recipes << Recipe.new(row[0], row[1])
    end
  end

  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end

cookbook = Cookbook.new('recipes.csv')
cookbook.add(Recipe.new('Food thing', 'Bake it at 5000 degrees celcius'))





