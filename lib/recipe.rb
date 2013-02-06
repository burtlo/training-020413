class Fixnum
  def cup
    "#{self} cup#{self != 1 ? 's' : ''}"
  end

  def dozen
    self * 12
  end

  alias_method :cups, :cup
end

class RecipeDefinition

  def initialize(&blk)
    # yield self if block_given?
    instance_eval(&blk) if blk
  end

  def name(value = nil)
    value ? @name = value : @name
  end

  alias_method :title, :name

  def name=(value)
    @name = value
  end

  def ingredients
    @ingredients ||= []
  end

  def ingredient(name,amount,description)
    ingredients << "#{amount} #{name} #{description}"
  end

  def instructions
    @instructions ||= []
  end

  def instruction(text)
    instructions << text
  end

  def serves(amount,unit)
    @servings = "#{amount} #{unit}"
  end

  attr_reader :servings

  def recipe
    Recipe.new name: name,
      instructions: instructions,
      ingredients: ingredients,
      serves: servings
  end

end

class Recipe
  def initialize(name_or_params,ingredients = nil,instructions = nil,servings = nil)
    parameters = convert_old_parameters(name_or_params,ingredients,instructions,servings)

    @name = parameters[:name]
    @ingredients = parameters[:ingredients]
    @instructions = parameters[:instructions]
    @servings = parameters.fetch(:servings,default_servings)
  end

  def default_servings
    "1 person"
  end

  def include?(ingredient)
    !!ingredients.find { |item| item.include? ingredient }
  end

  def include?(*specified_ingredients)
    found_ingredients(specified_ingredients).compact.length > 0 # or
    # found_ingredients.compact.length == found_ingredients.length # and
  end

  attr_reader :name, :servings, :ingredients

  private

  def found_ingredients(specified_ingredients)
    specified_ingredients.map do |specified_ingredient|
      ingredients.find { |item| item.include? specified_ingredient }
    end
  end

  def convert_old_parameters(name_or_params,ingredients,instructions,servings)
    return name_or_params if name_or_params.is_a? Hash

    { name: name_or_params,
      ingredients: ingredients,
      instructions: instructions }
  end
end

recipe_requirements = { name: "Oatmeal Cookies",
  ingredients: [ "1 cup brown sugar", "1 cup walnuts" ],
  instructions: [ "Preheat ..." ],
  serves: "2 dozen cookies" }

# oatmeal_cookies = Recipe.new recipe_requirements
# puts oatmeal_cookies.name
# puts oatmeal_cookies.include? "brown sugar"
# puts oatmeal_cookies.include? "peanuts"
# puts oatmeal_cookies.include? "brown sugar", "walnuts"

definition = RecipeDefinition.new
definition.name "Oatmeal Cookie"
definition.ingredient "butter", 1.cup, "softened"
definition.instruction "Preheat oven to 350 degrees F (175 degrees C)."
definition.serves 4.dozen, "cookies"
puts definition.recipe.name

definition = RecipeDefinition.new do |d|
  d.name "Chocolate Chip Cookies"

  d.ingredient "butter", 1.cup, "softened"
  d.instruction "Preheat oven to 350 degrees F (175 degrees C)."
  d.serves 4.dozen, "cookies"
end

puts definition.recipe.name


definition = RecipeDefinition.new do
  name "Sugar Cookies"
  ingredient "butter", 1.cup, "softened"
  instruction "Preheat oven to 350 degrees F (175 degrees C)."
  serves 4.dozen, "cookies"
end

puts definition.recipe.name