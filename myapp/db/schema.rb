# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100328124057) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_orders", :force => true do |t|
    t.string   "tube_size"
    t.string   "grade"
    t.string   "specification"
    t.integer  "unit_price"
    t.integer  "customer_id"
    t.integer  "serialize_id"
    t.integer  "quantity"
    t.string   "unit_of_measure"
    t.string   "tital_weight"
    t.decimal  "rate_per_kilo"
    t.decimal  "total_amount"
    t.string   "email"
    t.string   "office_address"
    t.string   "vat_no"
    t.string   "ecc_no"
    t.string   "delivery_address"
    t.string   "po_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_person"
    t.integer  "phone"
    t.integer  "mobile"
    t.string   "email"
    t.string   "excise_registration_no"
    t.string   "vat_no"
    t.string   "tin_no"
    t.string   "pan_no"
    t.string   "payment_terms"
    t.string   "bankers"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "deliverychallans", :force => true do |t|
    t.string   "delivery_challan_no"
    t.datetime "date"
    t.string   "vehicle_no"
    t.decimal  "od"
    t.decimal  "length"
    t.decimal  "thickness"
    t.integer  "quantity_pcs"
    t.integer  "quantity_mtrs"
    t.string   "remark"
    t.string   "vat_tin"
    t.string   "cst_tin"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "employees", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "phone"
    t.string   "mobile"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.integer  "user_id"
    t.integer  "mgr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
  end

  create_table "predespatchtcs", :force => true do |t|
    t.string   "test_certificate_no"
    t.integer  "customer_id"
    t.datetime "date"
    t.decimal  "od"
    t.decimal  "thickness"
    t.decimal  "length"
    t.integer  "quantity"
    t.string   "specification"
    t.string   "grade"
    t.string   "fin_condition"
    t.string   "uann_ann"
    t.decimal  "c_spec"
    t.integer  "c_obs"
    t.decimal  "mn_spec"
    t.decimal  "mn_obs"
    t.decimal  "s_spec"
    t.decimal  "s_obs"
    t.decimal  "p_spec"
    t.decimal  "p_obs"
    t.decimal  "si_spec"
    t.decimal  "si_obs"
    t.decimal  "al_spec"
    t.decimal  "al_obs"
    t.decimal  "ni_spec"
    t.decimal  "ni_obs"
    t.decimal  "cr_spec"
    t.decimal  "cr_obs"
    t.decimal  "ys_spec"
    t.decimal  "ys_obs"
    t.decimal  "ts_obs"
    t.decimal  "ts_spec"
    t.decimal  "el_spec"
    t.decimal  "el_obs"
    t.decimal  "gl_hardness_spec"
    t.decimal  "el_hardness_obs"
    t.decimal  "od_spec"
    t.decimal  "od_obs"
    t.decimal  "id_spec"
    t.decimal  "id_obs"
    t.decimal  "thick_spec"
    t.decimal  "thick_obs"
    t.decimal  "length_spec"
    t.decimal  "length_obs"
    t.string   "scratch_mark"
    t.string   "roll_pick_up"
    t.string   "pits_dents"
    t.string   "bend"
    t.string   "corner_radius"
    t.string   "squareness"
    t.string   "twist"
    t.string   "flaring_spec"
    t.string   "flaring_obs"
    t.string   "flattening_obs"
    t.string   "flattening_spec"
    t.string   "bending_spec"
    t.string   "bending_obs"
    t.string   "crushing_spec"
    t.string   "crushing_obs"
    t.integer  "uncoiler_report_id"
    t.integer  "slittingproduction_id"
    t.string   "inspected_by"
    t.string   "approved_by"
    t.integer  "tube_mill_performance_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "taxinvoice_id"
  end

  create_table "rawmaterial_categories", :force => true do |t|
    t.string   "name"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rawmaterials", :force => true do |t|
    t.string   "name"
    t.string   "grade"
    t.string   "width"
    t.string   "thickness"
    t.string   "coil_weight"
    t.string   "type"
    t.integer  "rawmaterial_category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesplans", :force => true do |t|
    t.string   "po_no"
    t.string   "customer_name"
    t.integer  "customer_id"
    t.string   "tube_size"
    t.integer  "serialize_id"
    t.integer  "quantity"
    t.string   "customer_code"
    t.integer  "pieces"
    t.integer  "meter"
    t.integer  "kilos"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "serializes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "slittingproductions", :force => true do |t|
    t.integer  "rawmaterial_id"
    t.integer  "slitting_id"
    t.datetime "shift"
    t.string   "operator_name"
    t.string   "source"
    t.decimal  "input_weight"
    t.decimal  "width"
    t.decimal  "thickness"
    t.string   "grade"
    t.string   "type"
    t.integer  "width_slitting"
    t.integer  "no_of_slits_slitting"
    t.decimal  "slit_coil_weight"
    t.decimal  "slit_weight"
    t.decimal  "scrap_weight"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slitting_coil_no"
  end

  create_table "slittings", :force => true do |t|
    t.integer  "rawmaterial_id"
    t.integer  "coil_width"
    t.decimal  "coil_weight"
    t.integer  "side_trim"
    t.decimal  "thickness"
    t.string   "scrap"
    t.decimal  "slit_width"
    t.decimal  "slit_weight"
    t.integer  "no_of_slits"
    t.decimal  "weight"
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slitting_coil_no"
  end

  create_table "taxinvoices", :force => true do |t|
    t.decimal  "od"
    t.decimal  "thickness"
    t.decimal  "length"
    t.string   "description"
    t.string   "average_content_packets"
    t.integer  "pieces"
    t.decimal  "meters"
    t.decimal  "rs_mtrs"
    t.decimal  "total_tariff_value"
    t.decimal  "rate_of_duty"
    t.decimal  "total_duty"
    t.decimal  "amount"
    t.decimal  "total_all"
    t.decimal  "excise_duty"
    t.decimal  "ed_cess"
    t.decimal  "sah_ed_cess"
    t.decimal  "vat_cst"
    t.decimal  "packing_forwarding"
    t.decimal  "grand_total"
    t.string   "vat_tin_no"
    t.string   "cst_tin_no"
    t.string   "part_vat_no"
    t.string   "party_cst_no"
    t.string   "pan_entry_no"
    t.string   "date_of_debit_entry_no"
    t.string   "entry_of_duty_entry_no"
    t.datetime "date_and_time_of_goods"
    t.string   "range"
    t.string   "range_two"
    t.string   "ecc_no"
    t.string   "notification_no"
    t.datetime "date_of_preparation_invoice"
    t.datetime "timeof_invoice"
    t.string   "po_no"
    t.string   "invoice_no"
    t.string   "challan_no"
    t.string   "vehicle_no"
    t.string   "lr_no"
    t.datetime "date_po"
    t.datetime "date_invoice_no"
    t.datetime "date_challan_no"
    t.string   "name_and_adress_of_buyor"
    t.string   "name_and_adress_of_consignee"
    t.integer  "chapter_heading_no"
    t.string   "name_of_deliver_goods"
    t.string   "pan_no"
    t.string   "commissionarate"
    t.string   "in_words"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tube_mill_performance_reports", :force => true do |t|
    t.string   "lot_no"
    t.integer  "customer_id"
    t.string   "od_width"
    t.decimal  "id_height"
    t.decimal  "thickness"
    t.decimal  "length"
    t.decimal  "id_fin_height"
    t.string   "drifting"
    t.string   "flattening"
    t.string   "specification"
    t.string   "rm_grade"
    t.string   "spl_requirement"
    t.datetime "date"
    t.datetime "shift"
    t.string   "operator_name"
    t.string   "inspector_name"
    t.decimal  "open"
    t.decimal  "joint"
    t.decimal  "tool_mark"
    t.decimal  "roll_mark"
    t.decimal  "pick_up"
    t.decimal  "scratch"
    t.decimal  "week_weld"
    t.decimal  "bend"
    t.decimal  "nf_c"
    t.string   "remarks"
    t.integer  "lot_numbers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "slittingproduction_id"
  end

  create_table "tube_mill_stoppage_reports", :force => true do |t|
    t.datetime "date"
    t.datetime "shift"
    t.decimal  "size"
    t.string   "customer"
    t.string   "description_of_breakdown"
    t.string   "type"
    t.string   "stoppage_code"
    t.datetime "from"
    t.datetime "to"
    t.string   "total_time"
    t.string   "remarks"
    t.string   "electrical_maintainence"
    t.string   "mechanical_maintainence"
    t.string   "operational"
    t.string   "roll_change"
    t.string   "raw_material_shortage"
    t.string   "man_power_shortage"
    t.string   "crane_delay"
    t.string   "power_failure"
    t.string   "remarks_last"
    t.string   "shift_incharge"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "uncoiler_reports", :force => true do |t|
    t.datetime "date"
    t.datetime "shift"
    t.string   "operator_name"
    t.integer  "slittingproduction_id"
    t.decimal  "tube_od"
    t.decimal  "width"
    t.decimal  "thickness"
    t.string   "grade"
    t.string   "type"
    t.decimal  "width_actual"
    t.decimal  "thickness_actual"
    t.string   "grade_actual"
    t.string   "type_actual"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                              :null => false
    t.string   "email",                              :null => false
    t.string   "crypted_password",                   :null => false
    t.string   "password_salt",                      :null => false
    t.string   "persistence_token",                  :null => false
    t.string   "single_access_token",                :null => false
    t.string   "perishable_token",                   :null => false
    t.integer  "login_count",         :default => 0, :null => false
    t.integer  "failed_login_count",  :default => 0, :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
