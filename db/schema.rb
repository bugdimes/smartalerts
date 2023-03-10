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

ActiveRecord::Schema[7.0].define(version: 2023_03_05_010602) do
  create_table "alerts", force: :cascade do |t|
    t.string "record_type"
    t.string "alert_type"
    t.integer "type_code"
    t.string "message_stream"
    t.string "name"
    t.string "tag"
    t.text "description"
    t.string "email"
    t.string "from"
    t.datetime "bounced_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
