class Category < ApplicationRecord
  has_many :toys_categories, dependent: :destroy
  has_many :toys, through: :toys_categories, dependent: :destroy
end
