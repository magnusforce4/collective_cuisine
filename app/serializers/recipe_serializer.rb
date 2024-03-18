class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :ingredients, :utensils

  def ingredients
    object.ingredients
  end

  def utensils
    object.utensils
  end
end
