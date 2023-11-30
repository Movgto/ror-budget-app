class Operation < ApplicationRecord
  belongs_to :user
  has_many :category_operations
  has_many :categories, through: :category_operations
  validates :name, presence: true
  validates :amount, presence: true
end
