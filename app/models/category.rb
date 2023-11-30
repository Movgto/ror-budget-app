class Category < ApplicationRecord
  belongs_to :user
  has_many :category_operations
  has_many :operations, through: :category_operations
  validates :name, presence: true

  def total
    operations.reduce(0) { |sum, operation| sum + operation.amount }
  end
end
