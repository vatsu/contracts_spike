class Contract < ApplicationRecord
  enum status: [:awaiting_signatures, :partially_signed, :signed]

  validates :status, :product, :client, presence: true
  validates_each :client do |record, attr, value|
    if value.segment != record.product.segment
      record.errors.add(attr, :invalid, message: 'client and product must have the same segment')
    end
  end
  validates :document, presence: true, if: Proc.new { |c| c.product.try(:required_document).present? }

  mount_uploader :document, DocumentUploader

  belongs_to :product
  belongs_to :client

  before_validation :set_status

  def document_description
    product.required_document.try(:description)
  end

  private
  def set_status
    self.status ||= "awaiting_signatures"
  end
end
