json.extract! gyrt_batch, :id, :cooperative_id, :batch_name, :total_gross_prem, :total_coop_sf, :total_net_prem, :members_count, :denied_count, :effective_date, :expiry_date, :terms, :created_at, :updated_at
json.url gyrt_batch_url(gyrt_batch, format: :json)
