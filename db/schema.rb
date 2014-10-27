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

ActiveRecord::Schema.define(version: 20141026202808) do

  create_table "announcements", force: true do |t|
    t.integer  "section_id"
    t.text     "info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "assignments", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.text     "description"
    t.datetime "duedate"
    t.float    "points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "colusseums", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "completed_courses", force: true do |t|
    t.integer  "course_id"
    t.integer  "section_id"
    t.string   "term"
    t.integer  "user_id"
    t.string   "grade"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "courses", force: true do |t|
    t.integer  "university_id"
    t.string   "name"
    t.text     "description"
    t.float    "credits"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "department_id"
    t.string   "department_tag"
    t.integer  "course_number"
  end

  create_table "courses_majors", id: false, force: true do |t|
    t.integer "major_id"
    t.integer "course_id"
  end

  create_table "degree_requirements", force: true do |t|
    t.integer  "course_id"
    t.integer  "major_id"
    t.integer  "minor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "department_tag"
    t.integer  "university_id"
  end

  create_table "enrollments", force: true do |t|
    t.integer  "user_id"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "learning_resources", force: true do |t|
    t.string   "name"
    t.string   "resourceurl"
    t.text     "description"
    t.integer  "section_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "majors", force: true do |t|
    t.integer  "university_id"
    t.string   "name"
    t.text     "description"
    t.integer  "department_id"
    t.integer  "units_required"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "credits"
  end

  create_table "majors_courses", id: false, force: true do |t|
    t.integer "major_id"
    t.integer "course_id"
  end

  create_table "posts", force: true do |t|
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "course_id"
  end

  create_table "reviews", force: true do |t|
    t.integer  "section_id"
    t.integer  "rating"
    t.text     "description"
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sections", force: true do |t|
    t.integer  "course_id"
    t.string   "term"
    t.string   "teacher"
    t.string   "schedule"
    t.string   "room"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_time"
    t.datetime "end_time"
    t.time     "time_start"
    t.time     "time_end"
    t.time     "days_of_class"
  end

  create_table "teachers", force: true do |t|
    t.string   "name"
    t.integer  "department_id"
    t.string   "degree"
    t.string   "alma_mater"
    t.integer  "university_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "universities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

# Could not dump table "users" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

end
