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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 0) do

  create_table "active_admin_comments", :force => true do |t|
    t.string   "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.integer  "unviersity_id"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "assignment_grades", :primary_key => "grade_id", :force => true do |t|
    t.integer "assignment_id", :null => false
    t.integer "user_id",       :null => false
    t.boolean "calculated"
    t.float   "grade_value"
  end

  create_table "assignment_types", :primary_key => "type_id", :force => true do |t|
    t.text     "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", :primary_key => "assignment_id", :force => true do |t|
    t.integer  "type_id",                              :null => false
    t.integer  "section_id",                           :null => false
    t.date     "due_date"
    t.integer  "highest_grade_value", :default => 100, :null => false
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attendance", :id => false, :force => true do |t|
    t.integer "section_id",                    :null => false
    t.integer "user_id",                       :null => false
    t.date    "class_date",                    :null => false
    t.boolean "present",    :default => true
    t.boolean "absent",     :default => false
    t.boolean "tardy",      :default => false
    t.boolean "excused",    :default => false
  end

  create_table "courses", :primary_key => "course_id", :force => true do |t|
    t.text     "number",        :null => false
    t.text     "name",          :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "university_id"
  end

  create_table "groups", :primary_key => "group_id", :force => true do |t|
    t.text    "name",               :null => false
    t.integer "associated_course",  :null => false
    t.integer "associated_section", :null => false
  end

  create_table "groups_users", :id => false, :force => true do |t|
    t.integer "group_id", :null => false
    t.integer "user_id",  :null => false
  end

  create_table "messages", :primary_key => "message_id", :force => true do |t|
    t.integer "sender_id",                           :null => false
    t.integer "receiver_id",                         :null => false
    t.boolean "sent",             :default => false
    t.text    "subject"
    t.text    "message"
    t.boolean "receiver_read",    :default => false
    t.boolean "sender_deleted",   :default => false
    t.boolean "receiver_deleted", :default => false
  end

  create_table "permissions", :primary_key => "perm_id", :force => true do |t|
    t.integer "role_id",   :null => false
    t.text    "perm_name", :null => false
  end

  create_table "quiz_answers", :primary_key => "answer_id", :force => true do |t|
    t.integer "question_id",                    :null => false
    t.text    "answer_text"
    t.boolean "is_correct",  :default => false, :null => false
  end

  create_table "quiz_attempts", :primary_key => "attempt_id", :force => true do |t|
    t.integer "question_id",                   :null => false
    t.integer "user_id",                       :null => false
    t.integer "answer_id",                     :null => false
    t.integer "question_count", :default => 0, :null => false
  end

  create_table "quiz_questions", :primary_key => "question_id", :force => true do |t|
    t.integer "quiz_id",       :null => false
    t.text    "question_text"
  end

  create_table "quizzes", :primary_key => "quiz_id", :force => true do |t|
    t.integer "section_id",                   :null => false
    t.date    "due_date"
    t.integer "times_allowed", :default => 1
  end

  create_table "roles", :primary_key => "role_id", :force => true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "roles", ["name", "resource_type", "resource_id"], :name => "index_Roles_on_role_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], :name => "index_Roles_on_role_name"

  create_table "sections", :primary_key => "section_id", :force => true do |t|
    t.integer  "course_id",  :null => false
    t.integer  "number",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections_users", :id => false, :force => true do |t|
    t.integer "section_id", :null => false
    t.integer "ur_id",      :null => false
  end

  create_table "universities", :primary_key => "university_id", :force => true do |t|
    t.integer "university_name", :null => false
  end

  create_table "uploads", :force => true do |t|
    t.string   "upload_file_name"
    t.string   "upload_content_type"
    t.integer  "upload_file_size"
    t.datetime "upload_updated_at"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "users", :primary_key => "user_id", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "name"
    t.integer  "university_id"
  end

  add_index "users", ["email"], :name => "index_Users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_Users_on_reset_password_token", :unique => true

  create_table "users_roles", :primary_key => "ur_id", :force => true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], :name => "index_UserRoles_on_user_id_and_role_id"

end
