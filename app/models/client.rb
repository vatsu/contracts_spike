class Client < ApplicationRecord
  include Segmentable
  validates :company, presence: true, if: Proc.new { |c| c.segment == "company" }
  validates :person, presence: true, if: Proc.new { |c| c.segment == "person" }

  belongs_to :company, optional: true
  belongs_to :person, optional: true

  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :person

  def name
    self.send(segment.to_sym).name
  end

  def tax_id
    self.send(segment.to_sym).tax_id
  end

  # Deals with different types of signatories depending on client's segment
  def signatories
    people = self.send(segment.to_sym)
    people = people.try(:people) || people
    # if :people is called successful, it's already an array,
    # thus it's needed to flatten it
    [ people ].flatten
  end
end
