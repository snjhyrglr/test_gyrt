json.extract! gyrt_agreement, :id, :cooperative_id, :product_name, :old_min_age, :old_max_age, :new_min_age, :new_max_age, :prem_rate, :rate_type, :coop_sf, :agent_sf, :gyrt_proposal_id, :policy_anniv_type, :min_enrolleess_count, :underwriting_status, :claims_status, :vp_status, :agent_coop_status, :created_at, :updated_at
json.url gyrt_agreement_url(gyrt_agreement, format: :json)
