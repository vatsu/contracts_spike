class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :segment }
  validates :segment, presence: true

  enum segment: [:company, :person]

  belongs_to :required_document, optional: true
end
