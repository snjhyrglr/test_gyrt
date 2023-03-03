# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# # ---BENEFITS
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/benefits.xlsx")
# (2..spreadsheet.last_row).each do |ben|
#   benefit = Benefit.find_or_initialize_by(name: spreadsheet.cell(ben, "A"))
#   benefit.abbreviation = spreadsheet.cell(ben, "B")

#   puts "#{benefit.name} - #{benefit.abbreviation} DONE!" if benefit.save!
# end

# ---GYRT BENEFIT RATES

# spreadsheet = Roo::Spreadsheet.open("./db/uploads/gyrt rates.xlsx")
# (3..spreadsheet.last_row).each do |rate|
#   gr = GyrtRate.find_or_initialize_by(age: spreadsheet.cell(rate, "A"), benefit_id: Benefit.find_by(abbreviation: spreadsheet.cell(rate, "C")).id)
#   gr.rate = spreadsheet.cell(rate, "B")

#   puts "#{gr.age} - #{gr.benefit.abbreviation} - #{gr.rate} DONE!" if gr.save!
# end

# ---GEO LOCATION
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/ph locations.xlsx")

# (2..spreadsheet.last_row).each do |x|
#   reg = GeoRegion.find_or_initialize_by(name: spreadsheet.cell(x, "A"))
#   reg.psgc_code = ''
#   puts "#{reg.name} - Done" if reg.save

#   prov = GeoProvince.find_or_initialize_by(name: spreadsheet.cell(x, "B"))
#   prov.psgc_code = ''
#   prov.geo_region_id = reg.id
#   puts "#{prov.name} - Done" if prov.save

#   mun = GeoMunicipality.find_or_initialize_by(name: spreadsheet.cell(x, "C"), geo_province_id: prov.id)
#   mun.psgc_code = ''
#   mun.geo_region_id = reg.id
#   puts "#{mun.name} - Done" if mun.save

#   bar = GeoBarangay.find_or_initialize_by(psgc_code: spreadsheet.cell(x, "E"))
#   bar.name = spreadsheet.cell(x, "D")
#   bar.geo_region_id = reg.id
#   bar.geo_province_id = prov.id
#   bar.geo_municipality_id = mun.id
#   puts "#{bar.name} - Done" if bar.save
# end

# # ---COOP TYPES
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/coop_types.xlsx")
# (2..spreadsheet.last_row).each do |ct|
#   ctype = CoopType.find_or_initialize_by(name: spreadsheet.cell(ct, "A"))
#   puts "#{ctype.name} - Done" if ctype.save!
# end

# # ---COOPS
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/Operating-Coops.xlsx")

# (5..spreadsheet.last_row).each do |c|
#   coop = Cooperative.find_or_initialize_by(name: spreadsheet.cell(c, "B"))
#   coop.geo_region_id = case spreadsheet.cell(c, "C")
#   when "CAR" then 1
#   when "CARAGA" then 17
#   when "NCR" then 14
#   when "Region 01" then 1
#   when "Region 02" then 2
#   when "Region 03" then 3
#   when "Region 04-A" then 4
#   when "Region 04-B" then 5
#   when "Region 05" then 6
#   when "Region 06" then 7
#   when "Region 07" then 8
#   when "Region 08" then 9
#   when "Region 09" then 10
#   when "Region 10" then 11
#   when "Region 11" then 12
#   when "Region 12" then 13
#   end
#   coop.registration_no = spreadsheet.cell(c, "A")
#   coop.coop_category_id = case spreadsheet.cell(c, "H") 
#   when "Electric" then 1
#   when "Multipurpose" then 2
#   when "Cooperative Bank" then 3
#   when "Credit" then 4
#   when "Federation-Secondary" then 5
#   when "Transport" then 6
#   when "Housing" then 7
#   when "Consumers" then 8
#   when "Agriculture" then 9
#   when "Dairy" then 10
#   when "Union-Secondary" then 11
#   when "Service" then 12
#   when "Agrarian Reform" then 13
#   when "Marketing" then 14
#   when "Water Service" then 15
#   when "Producers" then 16
#   when "Advocacy" then 17
#   when "Small Scale Mining" then 18
#   when "Health Service" then 19
#   when "Workers" then 20
#   when "Fishermen" then 21
#   when "Education" then 22
#   when "Insurance-Secondary" then 23
#   when "Labor Service" then 24
#   when "Federation-Tertiary" then 25
#   when "Technology Service" then 26
#   end
#   coop.coop_type_id = case spreadsheet.cell(c, "G")
#   when "Primary" then 1
#   when "Secondary" then 2 
#   when "Tertiary" then 3
#   when "Others" then 4
#   end
#   coop.status = spreadsheet.cell(c, "I")
#   coop.asset_size = spreadsheet.cell(c, "L")
#   coop.total_asset = spreadsheet.cell(c, "M")
#   puts "#{coop.name} -> Done! " if coop.save!
# end

# -----Rate Multipliers
# [
#   [1, 15, 300, 1.7],
#   [1, 301, 600, 1.2],
#   [1, 601, 1000, 1.0],
#   [2, 15, 50, 40],
#   [2, 51, 200, 25],
#   [2, 201, 500, 15]
# ].each do |rm|
#   rate = GyrtRateMultiplier.find_or_initialize_by(benefit_id: rm[0], min_count: rm[1])
#   rate.max_count = rm[2]
#   rate.rate = rm[3]
#   puts "#{rm[0]} age #{rm[1]}-#{rm[2]} rate: #{rm[3]} done!" if rate.save!
# end

# Loadings

# [
#   ["Contingency", 0.1],
#   ["Override", 0.09],
#   ["Admin Cost", 0.15]
# ].each do |rate|
#   load = GyrtLoading.find_or_initialize_by(name: rate[0])
#   load.rate = rate[1]
#   puts "#{rate[0]} --- done" if load.save!
# end
 

# Agents
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/SALES-TEAM-021522.xlsx")
# (3..101).each do |st|
#   user_name = (spreadsheet.cell(st, "C")[0] + spreadsheet.cell(st, "D")[0] + spreadsheet.cell(st, "B")).downcase.gsub(/\s+/, "")
#   agent = Agent.find_or_initialize_by(username: user_name)
#     agent.last_name = spreadsheet.cell(st, "B")
#     agent.first_name = spreadsheet.cell(st, "C")
#     agent.middle_name = spreadsheet.cell(st, "D")
#     agent.suffix = ""
#     agent.position = spreadsheet.cell(st, "E")
#     agent.date_hired = spreadsheet.cell(st, "I")
#     agent.status = true
#     agent.password = agent.username
#     agent.life_licensed = true
#     agent.nonlife_licensed = true
#     agent.email = spreadsheet.cell(st, "L")
#     puts "#{agent.username} - DONE!" if agent.save!
# end

# Employees
spreadsheet = Roo::Spreadsheet.open("./db/uploads/EMPLOYEE-MASTERLIST.xlsx")
(2..spreadsheet.last_row).each do |emp|
  user_name = (spreadsheet.cell(emp, "C")[0] + spreadsheet.cell(emp, "D")[0] + spreadsheet.cell(emp, "B")).downcase.gsub(/\s+/, "")

  div = Division.find_or_initialize_by(name: spreadsheet.cell(emp, "E"))
  div.shortname = "-"
  puts "#{div.name} - Done!" if div.save! 

  dep = Department.find_or_initialize_by(name: spreadsheet.cell(emp, "F"))
  dep.division_id = div.id
  dep.shortname = "-"
  puts "#{dep.name} - Done!" if dep.save! 

  employee = Employee.find_or_initialize_by(username: user_name)
  employee.department_id = dep.id
  employee.last_name = spreadsheet.cell(emp, "B")
  employee.first_name = spreadsheet.cell(emp, "C")
  employee.middle_name = spreadsheet.cell(emp, "D")
  employee.suffix = ""
  employee.code = spreadsheet.cell(emp, "A")
  employee.position = spreadsheet.cell(emp, "G")
  employee.password = employee.username
  employee.is_head = case spreadsheet.cell(emp, "H")
    when 1 then true
    else false
  end
  puts "#{employee.username} - #{employee.is_head} DONE!" if employee.save!
end

# Claim Requirements
# spreadsheet = Roo::Spreadsheet.open("./db/uploads/claims requirements.xlsx")
# (2..spreadsheet.last_row).each do |row|
#   req = ClaimRequirement.find_or_initialize_by(requirement: spreadsheet.cell(row, "A"))
#   req.description = spreadsheet.cell(row, "B")
#   req.requirement_type = spreadsheet.cell(row, "C")
#   puts "#{req.requirement} - Done!" if req.save!
# end