class Feature < ActiveRecord::Base
  
  has_one :feature_type
  belongs_to :property_feature
  
end
