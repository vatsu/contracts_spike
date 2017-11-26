class Person < ApplicationRecord
  #TODO: validates email and tax_id format
  validates :name, :tax_id, :email, presence: true
end
