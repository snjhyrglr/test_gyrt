class BatchItem < ApplicationRecord
  belongs_to :batch
  belongs_to :cooperative
  belongs_to :member
end
