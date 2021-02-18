class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates :cocktail, presence: true, length: { minimum: 1 }
  validates :ingredient, presence: true
end
