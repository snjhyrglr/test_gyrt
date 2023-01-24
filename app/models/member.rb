class Member < ApplicationRecord
  attr_accessor :file 

  has_many :cooperative_members
  has_many :cooperatives, through: :cooperative_members
  
  accepts_nested_attributes_for :cooperative_members

  def to_s 
    "#{last_name if last_name}, #{first_name if first_name} #{middle_name[0,1] if middle_name} "
  end

  def self.import_members(file, coop)
    puts "Coop_id: #{coop}"
    spreadsheet = Roo::Spreadsheet.open(file)
    (2..spreadsheet.last_row).each do |row|
      mem = Member.find_or_initialize_by(
        last_name: spreadsheet.cell(row, "A"),
        first_name: spreadsheet.cell(row, "B"),
        birth_date: spreadsheet.cell(row, "D")
      )
      mem.middle_name = spreadsheet.cell(row, "C")
      mem.gender = ""
     
      mem.save!
      
      cm = CooperativeMember.find_or_initialize_by(member_id: mem.id, cooperative_id: coop)
      cm.membership_date = spreadsheet.cell(row, "E")
      cm.old_member = true
      cm.save!

    end
  end
end
