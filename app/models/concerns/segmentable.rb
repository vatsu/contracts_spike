module Segmentable
  extend ActiveSupport::Concern
  included do
    enum segment: [:company, :person]

    validates :segment, presence: true
  end
end
