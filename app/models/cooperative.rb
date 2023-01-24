class Cooperative < ApplicationRecord
  belongs_to :geo_region, optional: true
  belongs_to :geo_province, optional: true
  belongs_to :geo_municipality, optional: true
  belongs_to :geo_barangay, optional: true
  belongs_to :coop_category, optional: true
  belongs_to :coop_type, optional: true

  has_many :matrices

  has_many :cooperative_members
  has_many :members, through: :cooperative_members


  def to_s 
    name
  end
end
