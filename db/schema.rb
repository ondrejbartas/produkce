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

ActiveRecord::Schema.define(:version => 20090519083556) do

  create_table "bordel", :id => false, :force => true do |t|
    t.string  "name"
    t.integer "user_id"
  end

  create_table "bought_tapes", :force => true do |t|
    t.integer  "purchase_cart_id"
    t.integer  "tape_type_id"
    t.integer  "price"
    t.integer  "value"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_users", :id => false, :force => true do |t|
    t.integer "category_id", :null => false
    t.integer "user_id",     :null => false
  end

  add_index "categories_users", ["category_id"], :name => "index_categories_users_on_category_id"
  add_index "categories_users", ["user_id"], :name => "index_categories_users_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "text"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "ico"
    t.string   "dic"
    t.string   "account"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_users", :id => false, :force => true do |t|
    t.integer "company_id"
    t.integer "user_id"
  end

  add_index "companies_users", ["company_id"], :name => "index_companies_users_on_company_id"
  add_index "companies_users", ["user_id"], :name => "index_companies_users_on_user_id"

  create_table "contacts", :force => true do |t|
    t.string   "address"
    t.string   "email"
    t.string   "phone"
    t.string   "note"
    t.boolean  "deleted"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "company_id"
  end

  create_table "finished_works", :force => true do |t|
    t.string   "note"
    t.integer  "status"
    t.integer  "value"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "histories", :force => true do |t|
    t.datetime "date"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "model"
    t.text     "history"
  end

  create_table "invoice_operations", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", :force => true do |t|
    t.integer  "project_id"
    t.string   "note"
    t.datetime "date"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_types", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted"
  end

  create_table "job_types_operation_types", :id => false, :force => true do |t|
    t.integer "operation_type_id"
    t.integer "job_type_id"
  end

  add_index "job_types_operation_types", ["job_type_id"], :name => "index_job_types_operation_types_on_job_type_id"
  add_index "job_types_operation_types", ["operation_type_id"], :name => "index_job_types_operation_types_on_operation_type_id"

  create_table "job_types_places", :id => false, :force => true do |t|
    t.integer "place_id"
    t.integer "job_type_id"
  end

  add_index "job_types_places", ["job_type_id"], :name => "index_job_types_places_on_job_type_id"
  add_index "job_types_places", ["place_id"], :name => "index_job_types_places_on_place_id"

  create_table "machines", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "missing_tapes", :force => true do |t|
    t.integer  "warehouse_control_id"
    t.integer  "tape_type_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "operation_types", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "operations", :force => true do |t|
    t.integer  "work_id"
    t.integer  "value"
    t.boolean  "finished"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "operation_type_id"
    t.integer  "tape_type_id"
    t.integer  "player_machine_id"
    t.integer  "record_machine_id"
    t.boolean  "their_tape"
    t.integer  "finished_work_id"
    t.string   "note_operator"
    t.integer  "count"
  end

  create_table "operator_plans", :force => true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.integer  "from"
    t.integer  "to"
    t.string   "note"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.string   "photo"
    t.datetime "startDate"
    t.datetime "endDate"
    t.boolean  "deleted"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "project_paths", :force => true do |t|
    t.string   "path"
    t.integer  "project_id"
    t.integer  "user_id"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.boolean  "deleted"
    t.integer  "company_id"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "status",     :default => 0
    t.integer  "user_id"
  end

  create_table "purchase_carts", :force => true do |t|
    t.string   "store"
    t.string   "url"
    t.datetime "purchase_date"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "reception_categories", :force => true do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reception_categories_reception_contacts", :id => false, :force => true do |t|
    t.integer "reception_category_id"
    t.integer "reception_contact_id"
  end

  add_index "reception_categories_reception_contacts", ["reception_category_id"], :name => "index_reception_categories_reception_contacts_on_reception_cate"
  add_index "reception_categories_reception_contacts", ["reception_contact_id"], :name => "index_reception_categories_reception_contacts_on_reception_cont"

  create_table "reception_contacts", :force => true do |t|
    t.string   "name"
    t.string   "phone"
    t.string   "address"
    t.string   "email"
    t.string   "web"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reception_events", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.date     "from"
    t.date     "to"
    t.boolean  "parking"
    t.boolean  "alert"
    t.boolean  "notice"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights", :force => true do |t|
    t.string   "controller"
    t.string   "action"
    t.integer  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "mine"
    t.string   "sub"
  end

  create_table "roles", :force => true do |t|
    t.integer  "idd"
    t.string   "name"
    t.string   "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "system_comments", :force => true do |t|
    t.integer  "user_id"
    t.string   "note"
    t.boolean  "finished"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "system_comment_id"
    t.boolean  "storno"
    t.boolean  "archiv"
  end

  create_table "tape_sells", :force => true do |t|
    t.integer  "project_id"
    t.integer  "tape_type_id"
    t.integer  "value"
    t.integer  "user_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price"
  end

  create_table "tape_types", :force => true do |t|
    t.string   "name"
    t.string   "note"
    t.integer  "tape_price"
    t.integer  "master_price"
    t.boolean  "master"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "limit"
    t.integer  "order"
  end

  create_table "update_logs", :force => true do |t|
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "name",        :limit => 40
    t.string   "login",       :limit => 40
    t.string   "password",    :limit => 40
    t.integer  "role"
    t.boolean  "deleted"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "access"
    t.string   "surname"
    t.string   "fullname",    :limit => nil
    t.integer  "logout_time",                :default => 10
    t.integer  "active_role"
  end

  create_table "warehouse_controls", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "note"
  end

  create_table "workflow_comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "workflow_comment_id"
    t.string   "note"
    t.boolean  "finished"
    t.boolean  "archiv"
    t.boolean  "storno"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "works", :force => true do |t|
    t.string   "note"
    t.integer  "length"
    t.boolean  "reserved"
    t.boolean  "deleted"
    t.boolean  "edited"
    t.integer  "project_id"
    t.integer  "job_type_id"
    t.integer  "user_id"
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "time"
    t.datetime "date"
  end

end
