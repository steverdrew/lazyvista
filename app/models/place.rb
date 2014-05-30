class Place < ActiveRecord::Base
  has_one :place_type
  belongs_to :region
  accepts_nested_attributes_for :place_type
end
