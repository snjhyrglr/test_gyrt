class GyrtRateTable < ApplicationRecord
  belongs_to :gyrt_proposal
  belongs_to :gyrt_rate
  belongs_to :cooperative
end
