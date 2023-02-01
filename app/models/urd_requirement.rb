class UrdRequirement < ApplicationRecord
  has_many :proposal_requirements, as: :requirement
  has_many :gyrt_proposals, through: :proposal_requirements, source: :proposal, source_type: "GyrtProposal"

  def create_proposal_req(gyrt_proposal)
    puts "#{gyrt_proposal}------------------------"
    gy = GyrtProposal.find_by(id: gyrt_proposal)
    pr = ProposalRequirement.find_or_initialize_by(proposal: gy, requirement: self) 
    pr.active = 1
    pr.save!
  end
end
