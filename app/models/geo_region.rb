class GeoRegion < ApplicationRecord
  has_many :cooperatives
  
  def to_s
    name
  end
end
