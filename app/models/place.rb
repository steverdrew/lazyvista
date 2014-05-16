class Place < ActiveRecord::Base
  has_one :place_type
  accepts_nested_attributes_for :place_type
end
