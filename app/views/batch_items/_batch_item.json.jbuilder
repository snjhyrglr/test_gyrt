json.extract! batch_item, :id, :batch_id, :cooperative_id, :member_id, :age, :sum_insured, :effective_date, :expiry_date, :terms, :gross_prem, :coop_sf, :net_prem, :created_at, :updated_at
json.url batch_item_url(batch_item, format: :json)
