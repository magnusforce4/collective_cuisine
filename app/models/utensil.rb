class Utensil < ApplicationRecord
  before_create :generate_custom_id
  has_and_belongs_to_many :recipes

  private

  def generate_custom_id
    new_id = "UTE_#{SecureRandom.hex(8)}"
    while self.class.exists?(id: new_id)
      new_id = "UTE_#{SecureRandom.hex(8)}"
    end
    self.id = new_id
  end
end
