class GyrtAgreement < ApplicationRecord
  belongs_to :cooperative
  belongs_to :gyrt_proposal

  has_one_attached :coop_logo
  has_one_attached :notarized_moa
  has_one_attached :signed_moa
  has_one_attached :members_masterlist
  has_many_attached :id_uploads

  validate :coop_logo_file_type, :id_uploads_file_type, :signed_moa_file_type, :notarized_moa_file_type
  

  def set_approval_status
    self.update(
      agent_coop_status: 0
    )
  end

  private

  def coop_logo_file_type
    if coop_logo.attached? && !coop_logo.content_type.in?(%w(image/jpeg image/png image/jpg))
      errors.add(:coop_logo, 'must be a JPEG, PNG or JPG file')
      coop_logo.purge
    end
  end

  def id_uploads_file_type
    return unless id_uploads.attached?

    id_uploads.each do |id|
     if !id.content_type.in?(%w(image/jpeg image/png image/jpg))
      errors.add(:id_uploads, 'must be a JPEG, PNG or JPG file')
      id.purge
     end
    end
    
  end

  def signed_moa_file_type
    if signed_moa.attached? && !signed_moa.content_type.in?(%w(application/pdf application/vnd.openxmlformats-officedocument.wordprocessingml.document))
      errors.add(:signed_moa, 'must be a PDF or Document file')
      signed_moa.purge
    end
  end

  def notarized_moa_file_type
    if notarized_moa.attached? && !notarized_moa.content_type.in?(%w(application/pdf))
      errors.add(:notarized_moa, 'must be a PDF file.')
      notarized_moa.purge
    end
  end

  def masterlist_file_type
    if members_masterlist.attached? && !members_masterlist.content_type.in?(%w(application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet))
      errors.add(:members_masterlist, 'must be an Excel file.')
      members_masterlist.purge
    end
  end
  
  

end
