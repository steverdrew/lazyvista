class PropertyAsset < ActiveRecord::Base
  
  belongs_to :property
  has_attached_file :asset,
    :styles => {
      :thumb => "100x100#",
      :small   => "300x300>",
      :large => "600x600>"
        }, :default_url => ""
  has_paper_trail
  do_not_validate_attachment_file_type :asset
  
  scope :asset_content_type, -> (asset_content_type) { where asset_content_type: asset_content_type }
  scope :asset_content_type_starts_with, -> (asset_content_type) { where("asset_content_type like ?", "#{asset_content_type}%")}
  scope :asset_not_null, where('asset is not null')
end
