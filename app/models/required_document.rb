class RequiredDocument < ApplicationRecord
  validates :description, presence: true
end
