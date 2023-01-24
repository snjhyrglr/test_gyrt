class GyrtCoverage < ApplicationRecord
  belongs_to :gyrt_batch
  belongs_to :member, optional: true
end
