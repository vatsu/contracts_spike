class Company < ApplicationRecord
  validates :name, :tax_id, presence: true
  validates :people, length: { minimum: 1, maximum: 2, message: "has to have one or two people associated with." }

  has_and_belongs_to_many :people
end
