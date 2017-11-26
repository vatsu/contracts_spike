class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :segment }
  validates :segment, presence: true

  enum segment: [:company, :person]
end
