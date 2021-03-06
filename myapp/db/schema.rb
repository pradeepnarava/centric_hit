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

ActiveRecord::Schema.define(:version => 20100512165126) do

  create_table "addresses", :force => true do |t|
    t.string   "company_name"
    t.string   "address_one"
    t.string   "address_two"
    t.string   "phone_no"
    t.string   "fax_no"
    t.string   "email"
    t.string   "contact_person"
    t.string   "excise_reg_no"
    t.string   "range"
    t.string   "division"
    t.string   "collectorate"
    t.string   "ecc_no"
    t.string   "vat_tin_no"
    t.string   "cst_tin_no"
    t.string   "ifc_no"
    t.string   "dgft_no"
    t.string   "pan_no"
    t.string   "service_tax_reg"
    t.string   "gta_red_no"
    t.string   "bankers"
    t.string   "bank_a_c_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
    t.string   "address"
  end

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "centricsteels", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "country"
    t.string   "phone1"
    t.string   "phone2"
    t.string   "email"
    t.string   "excise_registration_no"
    t.string   "vat_tin"
    t.string   "cst"
    t.string   "pan_no"
    t.string   "ecc_no"
    t.string   "ifc"
    t.string   "dgft_code"
    t.text     "range"
    t.string   "division"
    t.string   "collectorate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "clients", :force => true do |t|
    t.string   "customer_name"
    t.decimal  "od"
    t.string   "thickness"
    t.string   "length"
    t.string   "part_number"
    t.string   "is"
    t.string   "astm"
    t.string   "din"
    t.string   "jis"
    t.boolean  "automotive"
    t.boolean  "newprogram"
    t.boolean  "sop"
    t.boolean  "existing"
    t.boolean  "gen_engg"
    t.boolean  "boiler_air_heat"
    t.boolean  "furniture"
    t.string   "cut_chamf"
    t.string   "press_operations"
    t.string   "machining"
    t.string   "plating"
    t.decimal  "meters"
    t.decimal  "tons"
    t.decimal  "od_tol"
    t.decimal  "id_tol"
    t.decimal  "thick_tol"
    t.decimal  "length_tol"
    t.string   "id_fin_cut"
    t.decimal  "id_fin_height"
    t.decimal  "id_surface"
    t.decimal  "straightness"
    t.decimal  "od_surface_finish"
    t.boolean  "ect"
    t.decimal  "pressure_testing"
    t.decimal  "corner_radius"
    t.decimal  "uts"
    t.decimal  "ys"
    t.decimal  "elongation"
    t.string   "special_characteristics"
    t.string   "spc_requirement"
    t.string   "remarks"
    t.string   "name"
    t.string   "designation"
    t.string   "enclosures"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "customer_orders", :force => true do |t|
    t.string   "tube_size"
    t.integer  "customer_id"
    t.integer  "serialize_id"
    t.integer  "quantity"
    t.decimal  "total_weight",     :precision => 10, :scale => 4
    t.decimal  "rate_per_kilo",    :precision => 10, :scale => 4
    t.decimal  "total_amount",     :precision => 10, :scale => 4
    t.string   "ecc_no"
    t.string   "delivery_address"
    t.string   "po_no"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "rate_mtr",         :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "rate_pcs",         :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "rate_mt",          :precision => 12, :scale => 3, :default => 0.0
    t.datetime "po_date"
    t.decimal  "qty_mtr",          :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "qty_mt",           :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "qty_pcs",          :precision => 12, :scale => 3, :default => 0.0
    t.integer  "balance"
    t.integer  "status"
    t.string   "vat_no"
  end

  create_table "customers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "contact_person"
    t.string   "phone"
    t.string   "mobile"
    t.string   "email"
    t.string   "excise_registration_no"
    t.string   "vat_no"
    t.string   "tin_no"
    t.string   "pan_no"
    t.string   "payment_terms"
    t.string   "bankers"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "customer_code"
    t.string   "delivery"
    t.string   "fax_no"
    t.string   "range"
    t.string   "division"
    t.string   "collectorate"
    t.string   "ecc_no"
    t.string   "ifc_no"
    t.string   "dgft_code"
    t.string   "service_tax_reg"
    t.string   "gta_red_no"
    t.string   "bank_ac_no"
    t.string   "excise_duty"
    t.string   "payment"
    t.string   "octra"
    t.string   "vat"
    t.string   "cst"
    t.string   "pin"
    t.string   "street"
    t.string   "state"
    t.string   "city"
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
    t.integer  "customer_id"
    t.integer  "serialize_id"
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
    t.integer  "department_id"
    t.integer  "mgr_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
  end

  create_table "predespatchtcs", :force => true do |t|
    t.string   "test_certificate_no"
    t.integer  "taxinvoice_id"
    t.integer  "customer_id"
    t.datetime "date"
    t.decimal  "od"
    t.decimal  "thickness"
    t.decimal  "length"
    t.integer  "quantity"
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
    t.integer  "slittingproduction_id"
    t.string   "inspected_by"
    t.string   "approved_by"
    t.integer  "tube_mill_performance_report_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "specification_id"
    t.integer  "employee_id"
    t.integer  "inspected_id"
    t.integer  "rawmaterial_id"
  end

  create_table "rawmaterial_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rawmaterials", :force => true do |t|
    t.string   "name",                                                :null => false
    t.string   "width",                                               :null => false
    t.string   "thickness",                                           :null => false
    t.string   "coil_weight",                                         :null => false
    t.integer  "rawmaterial_category_id",                             :null => false
    t.integer  "status",                  :limit => 2, :default => 0
    t.string   "grade"
    t.datetime "dateofreciept"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "address_id"
    t.integer  "mother_id"
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesplans", :force => true do |t|
    t.integer  "customer_id"
    t.integer  "serialize_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "od"
    t.decimal  "length"
    t.decimal  "thikness"
    t.decimal  "order_wt",         :precision => 12, :scale => 4, :default => 0.0
    t.integer  "stock_quantity"
    t.decimal  "stock_wt",         :precision => 12, :scale => 4, :default => 0.0
    t.integer  "balance_quantity"
    t.decimal  "balance_wt",       :precision => 12, :scale => 4, :default => 0.0
    t.integer  "order_quantity"
  end

  create_table "serializes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
    t.decimal  "od",                  :precision => 10, :scale => 4
    t.decimal  "thikness",            :precision => 10, :scale => 4
    t.decimal  "length",              :precision => 10, :scale => 4
    t.string   "grade"
    t.string   "height"
    t.integer  "specification_id"
    t.string   "annealed_unannealed"
    t.string   "fincut_non_fincut"
    t.string   "end_condition"
    t.string   "packing_mode"
    t.string   "mat_type"
    t.decimal  "width"
  end

  create_table "slittingproductions", :force => true do |t|
    t.integer  "rawmaterial_id"
    t.integer  "slitting_id"
    t.decimal  "input_weight",                  :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "width",                         :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "thickness",                     :precision => 12, :scale => 3, :default => 0.0
    t.string   "grade"
    t.string   "type"
    t.decimal  "slit_coil_weight",              :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "slit_weight",                   :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "scrap_weight",                  :precision => 12, :scale => 3, :default => 0.0
    t.string   "remarks"
    t.integer  "status",           :limit => 2,                                :default => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slitting_coil_no"
    t.datetime "production_date"
    t.string   "shift"
    t.decimal  "width_slitting",                :precision => 12, :scale => 3, :default => 0.0
    t.integer  "operator_id"
  end

  create_table "slittings", :force => true do |t|
    t.integer  "rawmaterial_id"
    t.integer  "division_part",                                       :default => 0
    t.string   "scrap"
    t.decimal  "slit_width",           :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "slit_weight",          :precision => 12, :scale => 3, :default => 0.0
    t.integer  "no_of_slits"
    t.string   "remarks"
    t.string   "process_coil_wt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slitting_coil_no"
    t.integer  "slitt_rawmaterial_id"
    t.integer  "status",                                              :default => 0
    t.integer  "produced_no_of_slit",                                 :default => 0
    t.decimal  "total_weight",         :precision => 12, :scale => 3, :default => 0.0
  end

  create_table "specifications", :force => true do |t|
    t.string   "specification_name"
    t.string   "grade"
    t.decimal  "per_c",              :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "per_mn",             :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "per_s",              :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "per_p",              :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "per_si",             :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "per_al",             :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "per_ni",             :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "per_cr",             :precision => 12, :scale => 3, :default => 0.0
    t.string   "od_width"
    t.string   "id_height"
    t.string   "thick"
    t.string   "length"
    t.string   "flaring"
    t.string   "flattening"
    t.string   "bending"
    t.string   "crushing"
    t.string   "bend"
    t.string   "corner_radius"
    t.string   "squareness"
    t.string   "twist"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ys"
    t.string   "ts"
    t.string   "el"
    t.string   "hardness"
  end

  create_table "stoppages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "type_stop"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "po_no"
    t.string   "sales_order_no"
    t.string   "test_certificate_no"
    t.datetime "date"
    t.string   "invoice_no"
    t.string   "coil_packet_no"
    t.string   "t_w_l"
    t.integer  "no_of_sheets"
    t.string   "grade"
    t.decimal  "net_weight"
    t.decimal  "c"
    t.decimal  "v"
    t.decimal  "mn"
    t.decimal  "cu"
    t.decimal  "s"
    t.decimal  "nb"
    t.decimal  "p"
    t.decimal  "cr"
    t.decimal  "al"
    t.decimal  "ni"
    t.decimal  "si"
    t.decimal  "ti"
    t.decimal  "n"
    t.decimal  "ys"
    t.decimal  "u_t_s"
    t.decimal  "el_on_gl"
    t.decimal  "hrb"
    t.decimal  "vpn"
    t.decimal  "ecv"
    t.decimal  "n_value"
    t.decimal  "r_bar"
    t.string   "bend_test"
    t.string   "bright_matt"
    t.decimal  "ra"
    t.integer  "do_item_wise"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "city"
    t.string   "zipcode"
    t.string   "state"
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
    t.integer  "customer_id"
    t.datetime "date_of_preparation_invoice"
    t.integer  "deliverychallan_id"
  end

  create_table "tube_mill_performance_reports", :force => true do |t|
    t.integer  "customer_id"
    t.string   "od_width"
    t.decimal  "id_height",             :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "thickness",             :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "length",                :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "id_fin_height",         :precision => 12, :scale => 4, :default => 0.0
    t.string   "drifting"
    t.string   "flattening"
    t.string   "specification"
    t.string   "rm_grade"
    t.integer  "slittingproduction_id"
    t.string   "spl_requirement"
    t.datetime "date"
    t.decimal  "open",                  :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "joint",                 :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "tool_mark",             :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "roll_mark",             :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "pick_up",               :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "scratch",               :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "bend",                  :precision => 12, :scale => 4, :default => 0.0
    t.decimal  "nf_c",                  :precision => 12, :scale => 4, :default => 0.0
    t.string   "remarks"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status"
    t.decimal  "weak_weld",             :precision => 12, :scale => 4, :default => 0.0
    t.string   "shift"
    t.integer  "no_of_tube"
    t.integer  "lot_no"
    t.integer  "operator_id"
    t.integer  "inspector_id"
  end

  create_table "tube_mill_stoppage_reports", :force => true do |t|
    t.datetime "date"
    t.decimal  "size"
    t.string   "description_of_breakdown"
    t.time     "from"
    t.time     "to"
    t.string   "total_time"
    t.string   "remarks"
    t.string   "shift_incharge"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shift"
    t.integer  "type_stop"
  end

  create_table "uncoiler_reports", :force => true do |t|
    t.datetime "date"
    t.integer  "slittingproduction_id"
    t.decimal  "tube_od"
    t.decimal  "width"
    t.decimal  "thickness"
    t.string   "grade"
    t.string   "type"
    t.decimal  "width_actual",          :precision => 12, :scale => 3, :default => 0.0
    t.decimal  "thickness_actual",      :precision => 12, :scale => 3, :default => 0.0
    t.string   "grade_actual"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "shift"
    t.decimal  "type_actual",           :precision => 12, :scale => 3, :default => 0.0
    t.integer  "operator_id"
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
