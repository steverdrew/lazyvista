class Region < ActiveRecord::Base
  belongs_to :country
  has_many :places
end
