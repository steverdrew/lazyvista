class Property < ActiveRecord::Base
  
  belongs_to :user
  has_one :property_type
  has_one :country
  has_one :region
  has_one :place
  has_many :property_assets
  has_many :property_features
  has_one :audience
  
  has_paper_trail
  
  #has_many :assets, :dependent => :destroy
  
  accepts_nested_attributes_for :property_assets
  accepts_nested_attributes_for :property_type
  accepts_nested_attributes_for :country
  accepts_nested_attributes_for :region
  accepts_nested_attributes_for :place
  
    
  has_attached_file :promo_image, :styles => { :medium => "300x300>", :thumb => "100x100>", :mini => "50x50>" }, :default_url => ""
  has_attached_file :promo_video
  
  validates_attachment_content_type :promo_image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :promo_video, :content_type => /\Avideo\/.*\Z/
  
  #validates_attachment :promo_video, :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] }
  #validates_attachment :promo_video, :content_type => { :content_type => ["video/mpeg", "video/avi", "video/mp4", "audio/x-ms-wmv", "video/msvideo", "video/x-msvideo", "application/x-troff-msvideo", ] }
  #validates_attachment_content_type :promo_image, :content_type => /\Aimage\/.*\Z/
  #validates_attachment_content_type :promo_video, :content_type => /\Aimage\/.*\Z/
  #validates_attachment_content_type :promo_video, :content_type => { :content_type => ["video/mpeg", "video/avi", "video/mp4"] }
  
  scope :asset_content_type, -> (asset_content_type) { where asset_content_type: asset_content_type }
  scope :starts_with, -> (asset_content_type) { where("asset_content_type like ?", "#{asset_content_type}%")}
  scope :asset_not_null, where('asset is not null')
end
