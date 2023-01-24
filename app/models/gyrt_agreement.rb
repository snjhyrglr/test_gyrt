class GyrtAgreement < ApplicationRecord
  belongs_to :cooperative
  belongs_to :gyrt_proposal

  def set_approval_status
    self.update(
      underwriting_status: 0,
      claims_status: 0,
      vp_status: 0,
      agent_coop_status: 0
    )
  end

end
