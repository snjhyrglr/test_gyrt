# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_01_010920) do
  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "agents", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.date "birthdate"
    t.string "username"
    t.string "position"
    t.boolean "status"
    t.date "date_hired"
    t.boolean "life_licensed"
    t.boolean "nonlife_licensed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
  end

  create_table "batch_items", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "batch_id"
    t.bigint "cooperative_id"
    t.bigint "member_id"
    t.integer "age"
    t.decimal "sum_insured", precision: 10, scale: 2
    t.date "effective_date"
    t.date "expiry_date"
    t.integer "terms"
    t.decimal "gross_prem", precision: 10, scale: 2
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_batch_items_on_batch_id"
    t.index ["cooperative_id"], name: "index_batch_items_on_cooperative_id"
    t.index ["member_id"], name: "index_batch_items_on_member_id"
  end

  create_table "batches", charset: "utf8mb4", force: :cascade do |t|
    t.integer "quote_year"
    t.string "issuing_office"
    t.string "quote_no"
    t.bigint "cooperative_id"
    t.decimal "total_gross_prem", precision: 15, scale: 2
    t.decimal "total_coop_sf", precision: 15, scale: 2
    t.decimal "total_agent_sf", precision: 15, scale: 2
    t.decimal "total_net_prem", precision: 15, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_batches_on_cooperative_id"
  end

  create_table "benefits", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "abbreviation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claim_requirements", charset: "utf8mb4", force: :cascade do |t|
    t.text "requirement"
    t.text "description"
    t.string "requirement_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coop_categories", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coop_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cooperative_members", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id"
    t.bigint "member_id"
    t.date "membership_date"
    t.boolean "old_member"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_cooperative_members_on_cooperative_id"
    t.index ["member_id"], name: "index_cooperative_members_on_member_id"
  end

  create_table "cooperatives", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.bigint "geo_region_id"
    t.bigint "geo_province_id"
    t.bigint "geo_municipality_id"
    t.bigint "geo_barangay_id"
    t.string "address"
    t.bigint "coop_category_id"
    t.bigint "coop_type_id"
    t.string "status"
    t.string "asset_size"
    t.string "registration_no"
    t.decimal "total_asset", precision: 20, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["coop_category_id"], name: "index_cooperatives_on_coop_category_id"
    t.index ["coop_type_id"], name: "index_cooperatives_on_coop_type_id"
    t.index ["geo_barangay_id"], name: "index_cooperatives_on_geo_barangay_id"
    t.index ["geo_municipality_id"], name: "index_cooperatives_on_geo_municipality_id"
    t.index ["geo_province_id"], name: "index_cooperatives_on_geo_province_id"
    t.index ["geo_region_id"], name: "index_cooperatives_on_geo_region_id"
  end

  create_table "employees", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.string "suffix"
    t.string "birthdate"
    t.string "username"
    t.string "code"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
  end

  create_table "geo_barangays", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "geo_region_id", null: false
    t.bigint "geo_province_id", null: false
    t.bigint "geo_municipality_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_municipality_id"], name: "index_geo_barangays_on_geo_municipality_id"
    t.index ["geo_province_id"], name: "index_geo_barangays_on_geo_province_id"
    t.index ["geo_region_id"], name: "index_geo_barangays_on_geo_region_id"
  end

  create_table "geo_municipalities", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "geo_region_id", null: false
    t.bigint "geo_province_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_province_id"], name: "index_geo_municipalities_on_geo_province_id"
    t.index ["geo_region_id"], name: "index_geo_municipalities_on_geo_region_id"
  end

  create_table "geo_provinces", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "geo_region_id", null: false
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["geo_region_id"], name: "index_geo_provinces_on_geo_region_id"
  end

  create_table "geo_regions", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.string "psgc_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyrt_agreements", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id", null: false
    t.string "product_name"
    t.integer "old_min_age"
    t.integer "old_max_age"
    t.integer "new_min_age"
    t.integer "new_max_age"
    t.decimal "prem_rate", precision: 10, scale: 2
    t.string "rate_type"
    t.decimal "coop_sf", precision: 10, scale: 2
    t.decimal "agent_sf", precision: 10, scale: 2
    t.bigint "gyrt_proposal_id", null: false
    t.string "policy_anniv_type"
    t.string "min_enrollees_count"
    t.boolean "signed_by_coop"
    t.boolean "notarized"
    t.boolean "ids_upload"
    t.boolean "agent_coop_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "type_of_business"
    t.index ["cooperative_id"], name: "index_gyrt_agreements_on_cooperative_id"
    t.index ["gyrt_proposal_id"], name: "index_gyrt_agreements_on_gyrt_proposal_id"
  end

  create_table "gyrt_batches", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id"
    t.bigint "matrix_id"
    t.string "batch_name"
    t.decimal "total_gross_prem", precision: 15, scale: 2
    t.decimal "total_coop_sf", precision: 15, scale: 2
    t.decimal "total_net_prem", precision: 15, scale: 2
    t.integer "members_count"
    t.integer "denied_count"
    t.date "effective_date"
    t.date "expiry_date"
    t.integer "terms"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_gyrt_batches_on_cooperative_id"
    t.index ["matrix_id"], name: "index_gyrt_batches_on_matrix_id"
  end

  create_table "gyrt_coverages", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "gyrt_batch_id", null: false
    t.bigint "member_id"
    t.integer "age"
    t.decimal "gross_prem", precision: 15, scale: 2
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gyrt_batch_id"], name: "index_gyrt_coverages_on_gyrt_batch_id"
    t.index ["member_id"], name: "index_gyrt_coverages_on_member_id"
  end

  create_table "gyrt_loadings", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.decimal "rate", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "gyrt_proposal_benefits", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "gyrt_proposal_id"
    t.bigint "benefit_id"
    t.decimal "sum_insured", precision: 10, scale: 2
    t.decimal "base_prem", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_gyrt_proposal_benefits_on_benefit_id"
    t.index ["gyrt_proposal_id"], name: "index_gyrt_proposal_benefits_on_gyrt_proposal_id"
  end

  create_table "gyrt_proposals", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id"
    t.string "incharge_name"
    t.string "inchage_position"
    t.string "proposal_no"
    t.integer "new_min_age"
    t.integer "new_max_age"
    t.integer "old_min_age"
    t.integer "old_max_age"
    t.integer "ave_age"
    t.integer "members_count"
    t.decimal "total_premium", precision: 10, scale: 2
    t.decimal "coop_sf", precision: 10, scale: 2
    t.decimal "agent_sf", precision: 10, scale: 2
    t.boolean "actuarial_approval_status"
    t.boolean "underwriting_approval_status"
    t.boolean "claims_approval_status"
    t.boolean "agent_coop_approval_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "policy_anniv_type"
    t.string "type_of_business"
    t.date "validity"
    t.boolean "is_valid"
    t.index ["cooperative_id"], name: "index_gyrt_proposals_on_cooperative_id"
  end

  create_table "gyrt_rate_multipliers", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "benefit_id", null: false
    t.integer "min_count"
    t.integer "max_count"
    t.decimal "rate", precision: 3, scale: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_gyrt_rate_multipliers_on_benefit_id"
  end

  create_table "gyrt_rate_tables", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "gyrt_proposal_id"
    t.bigint "gyrt_rate_id", null: false
    t.bigint "cooperative_id", null: false
    t.integer "count"
    t.decimal "qx", precision: 10, scale: 4
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_gyrt_rate_tables_on_cooperative_id"
    t.index ["gyrt_proposal_id"], name: "index_gyrt_rate_tables_on_gyrt_proposal_id"
    t.index ["gyrt_rate_id"], name: "index_gyrt_rate_tables_on_gyrt_rate_id"
  end

  create_table "gyrt_rates", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "benefit_id", null: false
    t.integer "age"
    t.decimal "rate", precision: 8, scale: 6
    t.string "rate_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["benefit_id"], name: "index_gyrt_rates_on_benefit_id"
  end

  create_table "matrices", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "cooperative_id", null: false
    t.string "product_name"
    t.integer "old_min_age"
    t.integer "old_max_age"
    t.integer "new_min_age"
    t.integer "new_max_age"
    t.decimal "prem_rate", precision: 10, scale: 2
    t.string "rate_type"
    t.decimal "coop_sf", precision: 10, scale: 2
    t.decimal "agent_sf", precision: 10, scale: 2
    t.bigint "gyrt_proposal_id"
    t.string "proposal_no"
    t.string "policy_anniv"
    t.integer "min_enrollees_count"
    t.boolean "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cooperative_id"], name: "index_matrices_on_cooperative_id"
    t.index ["gyrt_proposal_id"], name: "index_matrices_on_gyrt_proposal_id"
  end

  create_table "members", charset: "utf8mb4", force: :cascade do |t|
    t.string "last_name"
    t.string "first_name"
    t.string "middle_name"
    t.date "birth_date"
    t.string "gender"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "proposal_remarks", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "gyrt_proposal_id"
    t.string "remark"
    t.string "remark_type"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gyrt_proposal_id"], name: "index_proposal_remarks_on_gyrt_proposal_id"
  end

  create_table "proposal_requirements", charset: "utf8mb4", force: :cascade do |t|
    t.string "proposal_type"
    t.bigint "proposal_id"
    t.string "requirement_type"
    t.bigint "requirement_id"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["proposal_type", "proposal_id"], name: "index_proposal_requirements_on_proposal"
    t.index ["requirement_type", "requirement_id"], name: "index_proposal_requirements_on_requirement"
  end

  create_table "urd_requirements", charset: "utf8mb4", force: :cascade do |t|
    t.text "requirement"
    t.text "description"
    t.string "requirement_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "geo_barangays", "geo_municipalities"
  add_foreign_key "geo_barangays", "geo_provinces"
  add_foreign_key "geo_barangays", "geo_regions"
  add_foreign_key "geo_municipalities", "geo_provinces"
  add_foreign_key "geo_municipalities", "geo_regions"
  add_foreign_key "geo_provinces", "geo_regions"
  add_foreign_key "gyrt_agreements", "cooperatives"
  add_foreign_key "gyrt_agreements", "gyrt_proposals"
  add_foreign_key "gyrt_coverages", "gyrt_batches"
  add_foreign_key "gyrt_rate_multipliers", "benefits"
  add_foreign_key "gyrt_rate_tables", "cooperatives"
  add_foreign_key "gyrt_rate_tables", "gyrt_rates"
  add_foreign_key "gyrt_rates", "benefits"
  add_foreign_key "matrices", "cooperatives"
end
