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

ActiveRecord::Schema.define(version: 20160326142359) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "afile_messagers", force: :cascade do |t|
    t.integer  "afile_id"
    t.integer  "message_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "afile_messagers", ["afile_id"], name: "index_afile_messagers_on_afile_id", using: :btree
  add_index "afile_messagers", ["message_id"], name: "index_afile_messagers_on_message_id", using: :btree

  create_table "afiles", force: :cascade do |t|
    t.text     "description"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "group_plans", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "plan_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_plans", ["group_id"], name: "index_group_plans_on_group_id", using: :btree
  add_index "group_plans", ["plan_id"], name: "index_group_plans_on_plan_id", using: :btree

  create_table "group_students", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "group_students", ["group_id"], name: "index_group_students_on_group_id", using: :btree
  add_index "group_students", ["student_id"], name: "index_group_students_on_student_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "title",      null: false
    t.integer  "course",     null: false
    t.integer  "semester",   null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "groups", ["title", "course", "semester"], name: "index_groups_on_title_and_course_and_semester", unique: true, using: :btree

  create_table "marks", force: :cascade do |t|
    t.integer  "mark",       null: false
    t.text     "comment"
    t.integer  "rating_id",  null: false
    t.integer  "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "marks", ["rating_id"], name: "index_marks_on_rating_id", using: :btree
  add_index "marks", ["student_id"], name: "index_marks_on_student_id", using: :btree

  create_table "messager_users", force: :cascade do |t|
    t.integer  "message_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messager_users", ["message_id"], name: "index_messager_users_on_message_id", using: :btree
  add_index "messager_users", ["user_id"], name: "index_messager_users_on_user_id", using: :btree

  create_table "messages", force: :cascade do |t|
    t.string   "header"
    t.text     "text"
    t.integer  "talk_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "messages", ["talk_id"], name: "index_messages_on_talk_id", using: :btree
  add_index "messages", ["user_id"], name: "index_messages_on_user_id", using: :btree

  create_table "page_pages", force: :cascade do |t|
    t.integer  "page1_id"
    t.integer  "page2_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "page_pages", ["page1_id"], name: "index_page_pages_on_page1_id", using: :btree
  add_index "page_pages", ["page2_id"], name: "index_page_pages_on_page2_id", using: :btree

  create_table "page_subjects", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "page_subjects", ["page_id"], name: "index_page_subjects_on_page_id", using: :btree
  add_index "page_subjects", ["subject_id"], name: "index_page_subjects_on_subject_id", using: :btree

  create_table "pages", force: :cascade do |t|
    t.boolean  "visibility", null: false
    t.string   "header",     null: false
    t.text     "contents",   null: false
    t.string   "alias",      null: false
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "pages", ["subject_id"], name: "index_pages_on_subject_id", using: :btree

  create_table "plan_subjects", force: :cascade do |t|
    t.integer  "plan_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "plan_subjects", ["plan_id"], name: "index_plan_subjects_on_plan_id", using: :btree
  add_index "plan_subjects", ["subject_id"], name: "index_plan_subjects_on_subject_id", using: :btree

  create_table "plans", force: :cascade do |t|
    t.string   "code",            null: false
    t.string   "title",           null: false
    t.float    "level",           null: false
    t.string   "form_of_study",   null: false
    t.integer  "university_id",   null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "training_period", null: false
  end

  add_index "plans", ["university_id"], name: "index_plans_on_university_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.string   "title",       null: false
    t.string   "s_type",      null: false
    t.integer  "offset",      null: false
    t.integer  "min_offset",  null: false
    t.integer  "max_offset",  null: false
    t.boolean  "necessarily", null: false
    t.integer  "subject_id",  null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "ratings", ["subject_id"], name: "index_ratings_on_subject_id", using: :btree

  create_table "role_users", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "role_id",    null: false
    t.json     "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "role_users", ["role_id"], name: "index_role_users_on_role_id", using: :btree
  add_index "role_users", ["user_id"], name: "index_role_users_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.text     "name",       null: false
    t.string   "short_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "roles", ["short_name"], name: "index_roles_on_short_name", unique: true, using: :btree

  create_table "specialties", force: :cascade do |t|
    t.string   "code",       limit: 10, null: false
    t.string   "gen",                   null: false
    t.string   "title",                 null: false
    t.string   "level",                 null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "specialties", ["code"], name: "index_specialties_on_code", unique: true, using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "last_name",           limit: 64, null: false
    t.string   "first_name",          limit: 64, null: false
    t.string   "second_name",         limit: 64
    t.date     "b_date",                         null: false
    t.string   "passport_id",                    null: false
    t.integer  "passport_series",                null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.integer  "user_id"
  end

  add_index "students", ["passport_id", "passport_series"], name: "index_students_on_passport_id_and_passport_series", unique: true, using: :btree
  add_index "students", ["user_id"], name: "index_students_on_user_id", using: :btree

  create_table "subject_teachers", force: :cascade do |t|
    t.integer  "subject_id"
    t.integer  "teacher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "subject_teachers", ["subject_id"], name: "index_subject_teachers_on_subject_id", using: :btree
  add_index "subject_teachers", ["teacher_id"], name: "index_subject_teachers_on_teacher_id", using: :btree

  create_table "subjects", force: :cascade do |t|
    t.string   "title",             null: false
    t.string   "s_type",            null: false
    t.integer  "type_of_reporting", null: false
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "talk_users", force: :cascade do |t|
    t.integer  "user1_id"
    t.integer  "user2_id"
    t.integer  "talk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "talk_users", ["talk_id"], name: "index_talk_users_on_talk_id", using: :btree
  add_index "talk_users", ["user1_id"], name: "index_talk_users_on_user1_id", using: :btree
  add_index "talk_users", ["user2_id"], name: "index_talk_users_on_user2_id", using: :btree

  create_table "talks", force: :cascade do |t|
    t.string   "title",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "last_name",   limit: 64, null: false
    t.string   "first_name",  limit: 64, null: false
    t.string   "second_name", limit: 64
    t.string   "degree",                 null: false
    t.string   "rank",                   null: false
    t.string   "position",               null: false
    t.date     "b_date",                 null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "universities", force: :cascade do |t|
    t.text     "name",       null: false
    t.text     "full_name",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "universities", ["name"], name: "index_universities_on_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  create_table "versions", force: :cascade do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id", using: :btree

  add_foreign_key "afile_messagers", "afiles"
  add_foreign_key "afile_messagers", "messages"
  add_foreign_key "group_plans", "groups"
  add_foreign_key "group_plans", "plans"
  add_foreign_key "group_students", "groups"
  add_foreign_key "group_students", "students"
  add_foreign_key "messager_users", "messages"
  add_foreign_key "messager_users", "users"
  add_foreign_key "messages", "talks"
  add_foreign_key "messages", "users"
  add_foreign_key "page_pages", "pages", column: "page2_id"
  add_foreign_key "page_subjects", "pages"
  add_foreign_key "page_subjects", "subjects"
  add_foreign_key "plan_subjects", "plans"
  add_foreign_key "plan_subjects", "subjects"
  add_foreign_key "role_users", "roles"
  add_foreign_key "role_users", "users"
  add_foreign_key "students", "users"
  add_foreign_key "subject_teachers", "subjects"
  add_foreign_key "subject_teachers", "teachers"
  add_foreign_key "talk_users", "talks"
  add_foreign_key "talk_users", "users", column: "user2_id"
end
