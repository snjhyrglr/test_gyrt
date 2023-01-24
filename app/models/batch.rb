class Batch < ApplicationRecord
  attr_accessor :file, :proposal_id
  belongs_to :cooperative
  has_many :batch_items

  validates :file, presence: :true


  def create_batch_items(file)
    spreadsheet = Roo::Spreadsheet.open(file)
    
    (2..spreadsheet.last_row).each do |row|
      mem = Member.find_or_initialize_by(
        last_name: spreadsheet.cell(row, "A"), 
        first_name: spreadsheet.cell(row, "B"),
        middle_name: spreadsheet.cell(row, "C"),
        birth_date: spreadsheet.cell(row, "D")
       )
       mem.gender = spreadsheet.cell(row, "E")
       mem.save!
       
      #  puts "###{spreadsheet.cell(mem, "D")}##"
       age = ((((Date.today + 6.months) - spreadsheet.cell(row, "D")) / 365).to_f).round
       puts "@@@#{age}@@@"
       if age <= 65
        item = self.batch_items.find_or_initialize_by(member_id: mem.id, cooperative_id: self.cooperative_id)
        item.effective_date = Date.today
        item.expiry_date = Date.today + 12.months
        item.terms = 12 # 1 year
        item.age = age
        item.sum_insured = GyrtProposalBenefit.find_by(gyrt_proposal_id: proposal_id, benefit_id: 1).sum_insured #Sum Insured = Life Benefit
        item.gross_prem = GyrtAgreement.find_by(cooperative_id: self.cooperative_id).prem_rate
        item.status = "PENDING" 
        item.save!
       end

    end
  end

  def compute_total_prem
    coop_sf_rate = GyrtAgreement.find_by(cooperative_id: self.cooperative_id).coop_sf
    agent_sf_rate = GyrtAgreement.find_by(cooperative_id: self.cooperative_id).agent_sf

    gross_prem = self.batch_items.sum(:gross_prem)
    coop_sf = gross_prem * coop_sf_rate
    agent_sf = gross_prem * agent_sf_rate
    net_prem = gross_prem - (coop_sf + agent_sf)

    self.update(
      total_gross_prem: gross_prem,
      total_coop_sf: coop_sf,
      total_agent_sf: agent_sf,
      total_net_prem: net_prem
    )
  end
  
end
