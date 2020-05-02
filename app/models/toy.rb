class Toy < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :manufacturer
  has_many :toys_categories, dependent: :destroy
  has_many :categories, through: :toys_categories, dependent: :destroy
  has_one_attached :picture
end
