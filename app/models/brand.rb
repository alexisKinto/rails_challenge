class Brand < ApplicationRecord
  validates :name, presence: true

  scope :alphabetical, -> { order(:name) }
end
