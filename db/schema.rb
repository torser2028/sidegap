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

ActiveRecord::Schema.define(version: 20180816040546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "pg_stat_statements"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "agendas", force: :cascade do |t|
    t.text     "body"
    t.date     "event_at"
    t.time     "time"
    t.integer  "legislative_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "plenary_commission"
    t.string   "event_type"
    t.text     "observation"
  end

  add_index "agendas", ["legislative_id"], name: "index_agendas_on_legislative_id", using: :btree

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "assignments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "assignments", ["role_id"], name: "index_assignments_on_role_id", using: :btree
  add_index "assignments", ["user_id"], name: "index_assignments_on_user_id", using: :btree

  create_table "attachments", force: :cascade do |t|
    t.string   "attachment"
    t.string   "title"
    t.date     "published_at"
    t.integer  "executive_id"
    t.integer  "legislative_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "judicial_id"
    t.integer  "rule_id"
    t.integer  "council_id"
  end

  add_index "attachments", ["council_id"], name: "index_attachments_on_council_id", using: :btree
  add_index "attachments", ["executive_id"], name: "index_attachments_on_executive_id", using: :btree
  add_index "attachments", ["judicial_id"], name: "index_attachments_on_judicial_id", using: :btree
  add_index "attachments", ["legislative_id"], name: "index_attachments_on_legislative_id", using: :btree
  add_index "attachments", ["rule_id"], name: "index_attachments_on_rule_id", using: :btree

  create_table "comments", force: :cascade do |t|
    t.text     "body"
    t.integer  "impact"
    t.integer  "legislative_id"
    t.integer  "rule_id"
    t.integer  "user_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "council_id"
  end

  add_index "comments", ["council_id"], name: "index_comments_on_council_id", using: :btree
  add_index "comments", ["legislative_id"], name: "index_comments_on_legislative_id", using: :btree
  add_index "comments", ["rule_id"], name: "index_comments_on_rule_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "commissions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "legislative", default: false
    t.boolean  "council",     default: false
  end

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "avatar"
    t.string   "email_1"
    t.string   "email_2"
    t.string   "email_3"
    t.string   "email_4"
    t.string   "email_5"
    t.string   "main_email"
    t.string   "extra_emails"
  end

  create_table "councillor_assignments", force: :cascade do |t|
    t.integer  "council_id"
    t.integer  "councillor_id"
    t.boolean  "author",        default: false
    t.boolean  "speaker",       default: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "councillor_assignments", ["council_id"], name: "index_councillor_assignments_on_council_id", using: :btree
  add_index "councillor_assignments", ["councillor_id"], name: "index_councillor_assignments_on_councillor_id", using: :btree

  create_table "councillors", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "political_party"
    t.string   "job"
    t.string   "commission"
    t.string   "office"
    t.text     "info"
    t.string   "source"
    t.string   "avatar"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "councils", force: :cascade do |t|
    t.text     "title"
    t.string   "number"
    t.string   "commission"
    t.string   "status"
    t.string   "topic"
    t.date     "filing_at"
    t.boolean  "notify"
    t.boolean  "warning"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.date     "monitoring_at"
    t.boolean  "aval"
    t.date     "commission_at"
    t.date     "plenary_at"
    t.text     "observation"
  end

  create_table "events", force: :cascade do |t|
    t.text     "body"
    t.date     "event_at"
    t.time     "time"
    t.string   "event_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "commission"
    t.string   "plenary"
    t.string   "place"
    t.text     "observation"
  end

  create_table "executives", force: :cascade do |t|
    t.text     "title"
    t.string   "number"
    t.string   "kind"
    t.date     "filing_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "institution_id"
  end

  add_index "executives", ["institution_id"], name: "index_executives_on_institution_id", using: :btree

  create_table "final_statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "follows", force: :cascade do |t|
    t.integer  "followable_id",                   null: false
    t.string   "followable_type",                 null: false
    t.integer  "follower_id",                     null: false
    t.string   "follower_type",                   null: false
    t.boolean  "blocked",         default: false, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables", using: :btree
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows", using: :btree

  create_table "institutions", force: :cascade do |t|
    t.string   "name"
    t.integer  "sector_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "rule",       default: false
    t.boolean  "executive",  default: false
    t.boolean  "active",     default: true
  end

  add_index "institutions", ["sector_id"], name: "index_institutions_on_sector_id", using: :btree

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "judicials", force: :cascade do |t|
    t.text     "title"
    t.string   "number"
    t.string   "kind"
    t.date     "filing_at"
    t.string   "court"
    t.string   "room"
    t.string   "type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string   "name"
    t.boolean  "executive",  default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "judicial",   default: false
    t.boolean  "rule",       default: false
  end

  create_table "laws", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legislative_attachments", force: :cascade do |t|
    t.string   "attachment"
    t.integer  "legislative_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "title"
    t.date     "published_at"
  end

  add_index "legislative_attachments", ["legislative_id"], name: "index_legislative_attachments_on_legislative_id", using: :btree

  create_table "legislative_stakeholders", force: :cascade do |t|
    t.integer  "legislative_id"
    t.integer  "stakeholder_id"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.boolean  "author"
    t.boolean  "speaker"
    t.boolean  "senate",         default: false
    t.boolean  "chamber",        default: false
  end

  add_index "legislative_stakeholders", ["legislative_id"], name: "index_legislative_stakeholders_on_legislative_id", using: :btree
  add_index "legislative_stakeholders", ["stakeholder_id"], name: "index_legislative_stakeholders_on_stakeholder_id", using: :btree

  create_table "legislatives", force: :cascade do |t|
    t.text     "title"
    t.string   "source"
    t.string   "chamber_number"
    t.string   "senate_number"
    t.string   "commission"
    t.string   "status"
    t.string   "final_status"
    t.string   "topic"
    t.string   "type_law"
    t.date     "senate_commission_at"
    t.date     "senate_plenary_at"
    t.date     "chamber_commission_at"
    t.date     "chamber_plenary_at"
    t.date     "filing_at"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.boolean  "active",                       default: true
    t.boolean  "warning",                      default: false
    t.boolean  "notify",                       default: false
    t.integer  "legislative_id"
    t.string   "law_number"
    t.date     "second_senate_commission_at"
    t.date     "second_senate_plenary_at"
    t.date     "second_chamber_commission_at"
    t.date     "second_chamber_plenary_at"
    t.date     "senate_settlement_at"
    t.date     "chamber_settlement_at"
    t.integer  "probability"
    t.string   "last_status"
    t.boolean  "new_project",                  default: true
    t.datetime "status_updated_at"
  end

  add_index "legislatives", ["legislative_id"], name: "index_legislatives_on_legislative_id", using: :btree

  create_table "mail_logs", force: :cascade do |t|
    t.string   "email"
    t.string   "subject"
    t.text     "options"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "publish_date"
  end

  create_table "officials", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address"
    t.string   "job"
    t.string   "office"
    t.string   "source"
    t.text     "info"
    t.string   "avatar"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "officials", ["institution_id"], name: "index_officials_on_institution_id", using: :btree

  create_table "periods", force: :cascade do |t|
    t.string  "name"
    t.boolean "status"
  end

  create_table "political_parties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "probabilities", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regions", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "regulatory_alerts", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.date     "filing_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "project_rule"
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rules", force: :cascade do |t|
    t.text     "title"
    t.string   "number"
    t.string   "kind"
    t.date     "filing_at"
    t.integer  "institution_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.date     "deadline_comments"
    t.string   "for_comments"
  end

  add_index "rules", ["institution_id"], name: "index_rules_on_institution_id", using: :btree

  create_table "sectors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
  end

  create_table "session_logs", force: :cascade do |t|
    t.string   "email"
    t.string   "ip_address"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "location"
    t.string   "coordinates"
    t.integer  "daily_sing_in_count"
  end

  create_table "sources", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stakeholders", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.string   "address",         default: "Capitolio Nacional, Calle 10 N° 7-50"
    t.string   "political_party"
    t.string   "job"
    t.string   "commission"
    t.string   "region"
    t.string   "office"
    t.text     "info"
    t.string   "source"
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
    t.string   "avatar"
    t.boolean  "status",          default: true
  end

  create_table "stakeholders_periods", force: :cascade do |t|
    t.integer "stakeholder_id"
    t.integer "period_id"
    t.string  "political_party"
    t.string  "job"
    t.string  "commission"
    t.string  "region"
    t.string  "phone"
    t.string  "address"
    t.string  "office"
  end

  add_index "stakeholders_periods", ["period_id"], name: "index_stakeholders_periods_on_period_id", using: :btree
  add_index "stakeholders_periods", ["stakeholder_id"], name: "index_stakeholders_periods_on_stakeholder_id", using: :btree

  create_table "statuses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "legislative", default: false
    t.boolean  "council",     default: false
  end

  create_table "stories", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.string   "source"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "project_rule"
    t.boolean  "sent",         default: false
    t.boolean  "legislative",  default: false
    t.boolean  "council",      default: false
    t.boolean  "rule",         default: false
    t.datetime "sent_at"
  end

  create_table "topics", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.boolean  "legislative", default: false
    t.boolean  "council",     default: false
  end

  create_table "user_notifications", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "institution_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "user_notifications", ["institution_id"], name: "index_user_notifications_on_institution_id", using: :btree
  add_index "user_notifications", ["user_id"], name: "index_user_notifications_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "job"
    t.integer  "company_id"
    t.string   "area"
    t.boolean  "active",                 default: true
    t.string   "passwd"
  end

  add_index "users", ["company_id"], name: "index_users_on_company_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "votable_id"
    t.string   "votable_type"
    t.integer  "voter_id"
    t.string   "voter_type"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "votes", ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
  add_index "votes", ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree

  add_foreign_key "attachments", "councils"
  add_foreign_key "attachments", "executives"
  add_foreign_key "attachments", "judicials"
  add_foreign_key "attachments", "legislatives"
  add_foreign_key "attachments", "rules"
  add_foreign_key "comments", "councils"
  add_foreign_key "comments", "legislatives"
  add_foreign_key "comments", "rules"
  add_foreign_key "comments", "users"
  add_foreign_key "councillor_assignments", "councillors"
  add_foreign_key "councillor_assignments", "councils"
  add_foreign_key "executives", "institutions"
  add_foreign_key "institutions", "sectors"
  add_foreign_key "legislative_stakeholders", "legislatives"
  add_foreign_key "legislative_stakeholders", "stakeholders"
  add_foreign_key "legislatives", "legislatives"
  add_foreign_key "officials", "institutions"
  add_foreign_key "rules", "institutions"
  add_foreign_key "stakeholders_periods", "periods"
  add_foreign_key "stakeholders_periods", "stakeholders"
  add_foreign_key "user_notifications", "institutions"
  add_foreign_key "user_notifications", "users"
  add_foreign_key "users", "companies"
end
