class GyrtRate < ApplicationRecord
  belongs_to :benefit

  has_many :gyrt_rate_tables
end
