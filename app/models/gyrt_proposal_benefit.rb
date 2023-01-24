class GyrtProposalBenefit < ApplicationRecord
  belongs_to :gyrt_proposal
  belongs_to :benefit

  # before_save :set_premium

  def set_premium(ben_id)
    puts "--->#{ben_id}"
    case ben_id
    when 1
      puts "/******* Proposal_ID: #{self.gyrt_proposal.id} *******/"

      # sum_rate = get_sum(benefit_id, self.gyrt_proposal.id, 'rate')
      # sum_count = get_sum(benefit_id, self.gyrt_proposal.id, 'count')
      sum_rate = GyrtRateTable.joins(:gyrt_rate).where(gyrt_proposal_id: gyrt_proposal_id, gyrt_rate: { age: 18..65 }).sum(:qx)
      sum_count = GyrtRateTable.joins(:gyrt_rate).where(gyrt_proposal_id: gyrt_proposal_id, gyrt_rate: { age: 18..65 }).sum(:count)
      
      prem_rate = sum_rate / sum_count
      puts "prem_rate: #{prem_rate}"
      puts "sum_rate: #{sum_rate}"
      puts "sum_count: #{sum_count}"
    else 
      prem_rate = GyrtRate.find_by(benefit_id: ben_id, age: self.gyrt_proposal.ave_age).rate
      puts "/*** #{prem_rate} ***/"
    end
    # unless benefit_id != 1 # Life
    #   puts "/******* Proposal_ID: #{self.gyrt_proposal.id} *******/"

    #   # sum_rate = get_sum(benefit_id, self.gyrt_proposal.id, 'rate')
    #   # sum_count = get_sum(benefit_id, self.gyrt_proposal.id, 'count')
    #   sum_rate = GyrtRateTable.where(gyrt_proposal_id: gyrt_proposal_id).sum(:qx)
    #   sum_count = GyrtRateTable.where(gyrt_proposal_id: gyrt_proposal_id).sum(:count)
      
    #   prem_rate = sum_rate / sum_count
    # else # Riders
    #   prem_rate = GyrtRate.find_by(benefit_id: benefit_id, age: self.gyrt_proposal.ave_age).rate
    #   puts "/*** #{prem_rate} ***/"
    # end

    multiplier = GyrtRateMultiplier.find_by('? between min_count and max_count and ? = benefit_id', self.gyrt_proposal.members_count, ben_id).rate
    final_prem_rate = prem_rate # + (prem_rate * (multiplier / 100))
    self.base_prem = case self.benefit_id 
    when 1 then (final_prem_rate * (sum_insured / 1000)) #Life Benefit
    when 2 then ((sum_insured * (final_prem_rate * 1000)) / 1000) #ADD
    when 3 then (((prem_rate * 1000) * sum_insured) / 1000) #TPD
    # when 4 then ((sum_insured * (prem_rate * 1000)) / 1000) #AMR
    end 
    puts "prem_rate - #{prem_rate}"
    puts "multiplier - #{multiplier}"
    puts "final_prem_rate - #{final_prem_rate}"

    # self.gyrt_proposal.update_attribute(average_age: GyrtRate.where())
  end

  def get_sum(benefit_id, gyrt_proposal_id, type)
    puts "ben-#{benefit_id}"
    puts "pro-#{gyrt_proposal_id}"
    puts "type-#{type}"
    if type == 'rate'
      # GyrtRateTable.find_by(gyrt_proposal_id: gyrt_proposal_id).sum(:qx)
     x = GyrtRateTable.where(gyrt_proposal_id: gyrt_proposal_id).sum(:qx)
    else
      # GyrtRateTable.find_by(gyrt_proposal_id: gyrt_proposal_id).sum(:count)
     y = GyrtRateTable.where(gyrt_proposal_id: gyrt_proposal_id).sum(:count)
    end
  end
end
