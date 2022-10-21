class Product < ApplicationRecord
  belongs_to :brand, optional: true

  validates :name, presence: true
  validates :price, numericality: { greater_than: 0, less_than_or_equal_to: 100 }

  scope :alphabetical, -> { order(:name) }

  def self.total_price
    sum(:price)
  end
end
