class ProposalRequirementsController < ApplicationController
  
  def remove
    @req = ProposalRequirement.find_by(id: params[:id])
    if @req.update_attribute(:active, false)
      redirect_back(fallback_location: params[:id], notice: "Removed.")
    end
  end

  def add
    @req = ProposalRequirement.find_by(id: params[:id])
    if @req.update_attribute(:active, true)
      redirect_back(fallback_location: params[:id], notice: "Added.")
    end
  end
  
end
