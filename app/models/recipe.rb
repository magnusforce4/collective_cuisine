class Recipe < ApplicationRecord
  before_create :generate_custom_id
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :utensils

  def self.search_by_ingredient(ingredient_identifier)
    if ingredient_identifier.to_i.to_s == ingredient_identifier
      joins(:ingredients).where("ingredients.id = ?", ingredient_identifier)
    else
      joins(:ingredients).where("ingredients.name LIKE ?", "%#{ingredient_identifier}%")
    end
  end

  def self.search_by_utensil(utensil_identifier)
    if utensil_identifier.to_i.to_s == utensil_identifier
      joins(:utensils).where("utensils.id = ?", utensil_identifier)
    else
      joins(:utensils).where("utensils.name LIKE ?", "%#{utensil_identifier}%")
    end
  end

  private

  def generate_custom_id
    new_id = "RECI_#{SecureRandom.hex(8)}"
    while self.class.exists?(id: new_id)
      new_id = "RECI_#{SecureRandom.hex(8)}"
    end
    self.id = new_id
  end
end
