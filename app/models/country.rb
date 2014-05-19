class Country < ActiveRecord::Base
  has_many :regions
  
  scope :inactive, -> (inactive) { where inactive: true }
  
end
