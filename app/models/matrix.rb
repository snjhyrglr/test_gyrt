class Matrix < ApplicationRecord
  belongs_to :cooperative
  belongs_to :gyrt_proposal

  has_many :batches

  accepts_nested_attributes_for :batches, reject_if: :all_blank, allow_destroy: true
  

  def to_s
    status
  end
end
