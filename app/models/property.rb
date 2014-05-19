class Property < ActiveRecord::Base
  belongs_to :user
  has_one :property_type
  has_one :country
  has_one :region
  has_one :place
  #has_many :assets, :dependent => :destroy
  
  #accepts_nested_attributes_for :assets
  accepts_nested_attributes_for :property_type
  accepts_nested_attributes_for :country
  accepts_nested_attributes_for :region
  accepts_nested_attributes_for :place
    
  has_attached_file :promo_image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => ""
  validates_attachment_content_type :promo_image, :content_type => /\Aimage\/.*\Z/
  
  
end
