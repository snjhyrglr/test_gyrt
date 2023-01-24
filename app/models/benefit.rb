class Benefit < ApplicationRecord
  # belongs_to :gyrt_option
  has_many :gyrt_rates

  def to_s 
    abbreviation
  end
end
