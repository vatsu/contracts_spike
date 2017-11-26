class Contract < ApplicationRecord
  enum status: [:awaiting_signatures, :partially_signed, :signed]

  validates :status, :product, :client, presence: true

  validates_each :client do |record, attr, value|
    if value.segment != record.product.segment
      record.errors.add(attr, :invalid, message: 'client and product must have the same segment')
    end
  end

  belongs_to :product
  belongs_to :client

  before_validation :set_status

  private
  def set_status
    self.status ||= "awaiting_signatures"
  end
end
