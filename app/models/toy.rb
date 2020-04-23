class Toy < ApplicationRecord
  validates :name, presence: true
  belongs_to :user
  belongs_to :manufacturer
end
