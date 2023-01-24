class CooperativeMember < ApplicationRecord
  belongs_to :cooperative
  belongs_to :member
end
