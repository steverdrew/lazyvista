class Property < ActiveRecord::Base
  belongs_to :user
  has_one :property_type
  has_one :country
  has_one :region
  has_one :place
  
  accepts_nested_attributes_for :property_type
  accepts_nested_attributes_for :country
  accepts_nested_attributes_for :region
  accepts_nested_attributes_for :place
  
end
