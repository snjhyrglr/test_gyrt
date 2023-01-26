class ProposalRequirement < ApplicationRecord
  belongs_to :proposal, polymorphic: true, optional: true
  belongs_to :requirement, polymorphic: true, optional: true
end
