class GyrtBatch < ApplicationRecord
  belongs_to :cooperative

  has_many :gyrt_coverages

  attr_accessor :file # virtual attribute

  before_save :set_default_attributes

  def to_s 
    batch_name
  end

  def create_gyrt_coverages_and_compute_premium(file)
    count = 1
    spreadsheet = Roo::Spreadsheet.open(file)
    (2..spreadsheet.last_row).each_with_index do |row, index|
      mem = Member.find_or_initialize_by(last_name: spreadsheet.cell(row, "A"), first_name: spreadsheet.cell(row, "B"), middle_name: spreadsheet.cell(row, "C"), birth_date: spreadsheet.cell(row, "D"))
      mem.gender = spreadsheet.cell(row, "E")
      mem.cooperative_id = self.cooperative_id
      mem.save!

      item = self.gyrt_coverages.find_or_initialize_by(member_id: mem.id)
      item.age =  Date.today.year - mem.birth_date.year
      item.gross_prem = Matrix.find_by(cooperative_id: self.cooperative_id).prem_rate
      item.status = "FOR REVIEW"
      item.save!

      coop_mem = CooperativeMember.find_or_initialize_by(member_id: mem.id, cooperative_id: self.cooperative_id)
      coop_mem.save!

      count += 1
    end
    self.members_count = count
  end

  def compute_total_prem
    self.update(
      total_gross_prem: self.gyrt_coverages.sum(:gross_prem),
      total_coop_sf: Matrix.find_by(cooperative_id: self.cooperative_id).coop_sf * self.gyrt_coverages.sum(:gross_prem),
      total_net_prem: self.gyrt_coverages.sum(:gross_prem) - Matrix.find_by(cooperative_id: self.cooperative_id).coop_sf * self.gyrt_coverages.sum(:gross_prem)
    )
  end

  def set_default_attributes
    self.batch_name = "HO-GYRT-#{sprintf '%05d', ((GyrtBatch.maximum(:id) || 1)).to_s}"
    self.effective_date = Date.today
    self.expiry_date = self.effective_date + 1.year
    self.terms = 12
    self.denied_count = 0
  end
end
