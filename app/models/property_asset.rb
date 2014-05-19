class PropertyAsset < ActiveRecord::Base
  
  belongs_to :property
  has_attached_file :asset,
    :styles => {
      :thumb=> "100x100#",
      :small  => "300x300>",
      :large => "600x600>"
        }
  
end
