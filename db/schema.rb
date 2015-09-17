# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150917134649) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_contents", force: :cascade do |t|
    t.string   "area"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string   "question",                   null: false
    t.text     "answer",                     null: false
    t.integer  "position"
    t.integer  "industry_id"
    t.boolean  "display",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "frequently_asked_questions", ["industry_id"], name: "index_frequently_asked_questions_on_industry_id", using: :btree

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "industries", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "colour"
    t.integer  "position"
    t.text     "accreditations"
    t.string   "subdomain"
    t.string   "menu"
    t.boolean  "display",        default: true
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "industry_banners", force: :cascade do |t|
    t.integer  "position"
    t.string   "title",                             null: false
    t.text     "content"
    t.string   "button_text",                       null: false
    t.string   "more_text",   default: "Read more"
    t.string   "more_link"
    t.string   "image"
    t.boolean  "display",     default: true
    t.integer  "industry_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  add_index "industry_banners", ["industry_id"], name: "index_industry_banners_on_industry_id", using: :btree

  create_table "optimadmin_administrators", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "role",                   null: false
    t.string   "auth_token"
    t.string   "password_digest",        null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "optimadmin_administrators", ["auth_token"], name: "index_optimadmin_administrators_on_auth_token", using: :btree
  add_index "optimadmin_administrators", ["email"], name: "index_optimadmin_administrators_on_email", using: :btree
  add_index "optimadmin_administrators", ["username"], name: "index_optimadmin_administrators_on_username", using: :btree

  create_table "optimadmin_documents", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "document",    null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_external_links", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_images", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "image",       null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_links", force: :cascade do |t|
    t.string   "menu_resource_type"
    t.integer  "menu_resource_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "optimadmin_menu_item_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "optimadmin_menu_item_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_item_anc_desc_idx", unique: true, using: :btree
  add_index "optimadmin_menu_item_hierarchies", ["descendant_id"], name: "menu_item_desc_idx", using: :btree

  create_table "optimadmin_menu_items", force: :cascade do |t|
    t.string   "menu_name",       limit: 100
    t.string   "name",            limit: 100
    t.integer  "parent_id"
    t.boolean  "deletable",                   default: true
    t.boolean  "new_window",                  default: false
    t.string   "title_attribute", limit: 100
    t.integer  "position",                    default: 0
    t.integer  "link_id"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "optimadmin_menu_items", ["link_id"], name: "index_optimadmin_menu_items_on_link_id", using: :btree

  create_table "optimadmin_module_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_site_settings", force: :cascade do |t|
    t.string "key"
    t.string "value"
    t.string "environment"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.string   "image"
    t.string   "style",                        null: false
    t.string   "layout",                       null: false
    t.boolean  "display",       default: true
    t.text     "content",                      null: false
    t.integer  "industry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "pages", ["industry_id"], name: "index_pages_on_industry_id", using: :btree

  create_table "product_ranges", force: :cascade do |t|
    t.string   "title",                         null: false
    t.text     "summary",                       null: false
    t.string   "image"
    t.integer  "industry_id"
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "products_count"
    t.boolean  "display",        default: true
    t.boolean  "home_highlight", default: true
  end

  add_index "product_ranges", ["industry_id"], name: "index_product_ranges_on_industry_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "title",                                  null: false
    t.text     "summary",                                null: false
    t.text     "description"
    t.string   "technical_specification"
    t.string   "image"
    t.string   "video_url"
    t.integer  "product_range_id"
    t.boolean  "display",                 default: true
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "home_highlight"
  end

  add_index "products", ["product_range_id"], name: "index_products_on_product_range_id", using: :btree

  create_table "team_members", force: :cascade do |t|
    t.string   "name"
    t.string   "image"
    t.string   "job_title"
    t.integer  "position"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "frequently_asked_questions", "industries"
  add_foreign_key "industry_banners", "industries"
  add_foreign_key "pages", "industries"
  add_foreign_key "product_ranges", "industries"
  add_foreign_key "products", "product_ranges"
end
