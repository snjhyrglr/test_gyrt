class GyrtProposal < ApplicationRecord
  attr_accessor :file, :average_age

  belongs_to :cooperative
  
  has_many :gyrt_proposal_benefits
  has_many :benefits, through: :gyrt_proposal_benefits
  has_many :gyrt_rate_tables
  has_many :proposal_remarks

  has_many :proposal_requirements, as: :proposal
  has_many :claim_requirements, through: :proposal_requirements, source: :requirement, source_type: "ClaimRequirement"
  has_many :urd_requirements, through: :proposal_requirements, source: :requirement, source_type: "UrdRequirement"
  # belongs_to :matrix

  accepts_nested_attributes_for :gyrt_proposal_benefits, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :benefits, reject_if: :all_blank, allow_destroy: true
  
  before_save :set_proposal_no

  # INCHARGE_NAME = 

  def matrix_name
    "Proposal for #{self.cooperative.name} "
  end

  def compute_total_prem
    def_loading = GyrtLoading.sum(:rate)
    loading = (1 - (self.coop_sf + self.agent_sf + def_loading))
    # final_loading = 1 - (((self.coop_sf + self.agent_sf + def_loading) / 100))
    final_premium = self.gyrt_proposal_benefits.pluck(:base_prem).sum / loading
    # x = GyrtProposalBenefit.where(gyrt_proposal_id: self.id).sum(:base_prem)
    puts "***#{self.gyrt_proposal_benefits.pluck(:base_prem).sum}***"
    puts "***#{loading}***"
    puts "***#{final_premium}***"

    self.update(
      total_premium: final_premium.ceil(-1),
      actuarial_approval_status: false,
      underwriting_approval_status: false,
      claims_approval_status: false,
      agent_coop_approval_status: false
    )
  end

  def set_proposal_no
    self.proposal_no = "HO-#{sprintf '%05d', ((GyrtProposal.maximum(:id) ||  0 + 1)).to_s}"
    # self.proposal_no = "HO-#{sprintf '%05d', (GyrtProposal.maximum(:id)+1).to_s}"
  end

  def self.set_validity
    self.update(
      validity: self.created_at + 3.months,
      is_valid: true
    )
  end
  

  def get_ages_for_computation(file)
    final_age = 0
    count = 0
    old_min = 0
    old_max = 0

    spreadsheet = Roo::Spreadsheet.open(file)
    (2..spreadsheet.last_row).each_with_index do |mem,index|
      # age = (Date.today + 6.months).year - spreadsheet.cell(mem, "D").yearnu
      age = ((((Date.today + 6.months) - spreadsheet.cell(mem, "D")) / 365).to_f).round
      puts "ito ay age - #{age}"
      final_age += age

      if age <= 65
        count += 1
      end

      if age > old_max
        old_max = age
      end
      
      if age < old_min
        old_min = age
      else
        old_min = old_max
      end

      # puts "#{self.benefit_id} ----"
      # rate_id = GyrtRate.find_by(age: age, benefit_id: self.gyrt_proposal_benefits.first.benefit_id).id

      # puts "#{rate_id }----"

      # rate_table = GyrtRateTable.find_or_initialize_by(gyrt_proposal_id: self.id, cooperative_id: self.cooperative.id, gyrt_rate_id: rate_id)
      # rate_table.count = 1
      # rate_table.qx = rate_table.count * (GyrtRate.find_by(id: rate_id).rate * 1000)
      # rate_table.save!
       
      
    end
    
    average_age = final_age / (count + 1)
    puts "Average age = #{average_age} *** Final age = #{final_age}"
    self.ave_age = average_age
    self.members_count = count
    #self.old_min_age = 18
    #self.old_max_age = old_max.ceil(-1)
    
    puts "/******* Benefit_id: #{self.gyrt_proposal_benefits.first.benefit_id} *******/"

    self.gyrt_proposal_benefits.each do |gpben|
      puts "--->#{gpben.benefit_id}<---"
      # gpben = self.gyrt_proposal_benefits.find_or_initialize_by(gyrt_proposal_id: self.id, benefit_id: self.gyrt_proposal_benefits.first.benefit_id)
      gpben.set_premium(gpben.benefit_id)
      # gpben.save!
    end

  end

  def get_gyrt_table(file)

    spreadsheet = Roo::Spreadsheet.open(file)

    (2..spreadsheet.last_row).each_with_index do |mem,index|
      # age = (Date.today + 6.months).year - spreadsheet.cell(mem, "D").year
      age = ((((Date.today + 6.months) - spreadsheet.cell(mem, "D")) / 365).to_f).round
    # puts "#{self.benefit_id} ----"
      rate_id = GyrtRate.find_by(age: age, benefit_id: self.gyrt_proposal_benefits.first.benefit_id).id
      rate_table = GyrtRateTable.find_or_initialize_by(gyrt_proposal_id: self.id, cooperative_id: self.cooperative.id, gyrt_rate_id: rate_id).increment(:count)
      # rate_table.count = 1
      rate_table.qx = rate_table.count * (GyrtRate.find_by(id: rate_id).rate * 1000)
      rate_table.save!

      # rate_table = GyrtRateTable.upsert(
      #   gyrt_proposal_id: self.id, 
      #   cooperative_id: self.cooperative_id, 
      #   gyrt_rate_id: rate_id,
      #   count: self.gyrt_rate_table.count + 1,
      #   qx: self.gyrt_rate_table.count * (GyrtRate.find_by(id: rate_id).rate * 1000)
      # )
    end
  end

  def save_claims_requirements 
    claims_req = ClaimRequirement.all
    claims_req.each do |cr|
      pr = ProposalRequirement.find_or_initialize_by(proposal: self, requirement: cr)
      pr.active = 1
      pr.save!
    end
    
  end

  def save_urd_requirements
    urd_req = UrdRequirement.all
    urd_req.each do |ur|
      pr = ProposalRequirement.find_or_initialize_by(proposal: self, requirement: ur)
      pr.active = 1
      pr.save!
    end
  end
  
  def convert_service_fee
    self.update(
      coop_sf: self.coop_sf / 100,
      agent_sf: self.agent_sf / 100
    )
  end

  def matrix_status(id)
    Matrix.find_by(gyrt_proposal_id: id).status
  end

end
