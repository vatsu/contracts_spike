class Product < ApplicationRecord
  include Segmentable

  validates :name, presence: true, uniqueness: { scope: :segment }
  validates :segment, presence: true

  belongs_to :required_document, optional: true

  accepts_nested_attributes_for :required_document
end
