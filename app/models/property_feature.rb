class PropertyFeature < ActiveRecord::Base
  
  has_paper_trail
  
  belongs_to :property
  has_many :feature_types
  
end
