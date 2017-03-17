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

ActiveRecord::Schema.define(version: 20170315111107) do

  create_table "groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sid",        limit: 50,               comment: "sid"
    t.string   "group_name", limit: 50,               comment: "品牌名称"
    t.integer  "status",                              comment: "状态,0:删除,1:正常"
    t.string   "memo",       limit: 500,              comment: "品牌备注"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["group_name", "status"], name: "ix_name_status", using: :btree
    t.index ["id"], name: "index_groups_on_id", using: :btree
  end

  create_table "groups_members", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "group_id"
    t.integer "member_id"
    t.index ["group_id", "member_id"], name: "ix_group_id_member_id", using: :btree
  end

  create_table "interface_params", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "interface_id",                          comment: "接口id"
    t.string   "sid",          limit: 50,               comment: "sid"
    t.string   "param_name",   limit: 25,               comment: "参数名称"
    t.string   "param_type",   limit: 25,               comment: "参数类型"
    t.string   "param_desc",   limit: 200,              comment: "参数描述"
    t.boolean  "param_must",                            comment: "是否必须参数, 0:非必须,1:必须"
    t.integer  "status",                                comment: "状态,0:删除,1:正常"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["id"], name: "index_interface_params_on_id", using: :btree
    t.index ["param_name", "status"], name: "ix_param_name_status", using: :btree
  end

  create_table "interface_responses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sid",           limit: 50,               comment: "sid"
    t.integer  "interface_id",                           comment: "接口id"
    t.string   "response_name", limit: 25,               comment: "返回值名称"
    t.string   "response_type", limit: 25,               comment: "返回值类型"
    t.string   "response_desc", limit: 200,              comment: "返回值描述"
    t.integer  "status",                                 comment: "状态,0:删除,1:正常"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["id"], name: "index_interface_responses_on_id", using: :btree
    t.index ["response_name", "status"], name: "ix_response_name_status", using: :btree
  end

  create_table "interfaces", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "group_id",                                    comment: "品牌关联id"
    t.string   "sid",              limit: 50,                 comment: "sid"
    t.string   "interface_name",   limit: 50,                 comment: "接口名称"
    t.string   "domain",           limit: 100,                comment: "域名"
    t.string   "product_url",      limit: 200,                comment: "生产url"
    t.string   "test_url",         limit: 200,                comment: "测试url"
    t.string   "request_type",     limit: 20,                 comment: "请求方式"
    t.string   "response_type",    limit: 20,                 comment: "返回值格式"
    t.string   "response_content", limit: 1000,               comment: "返回结果"
    t.integer  "status",                                      comment: "状态,0:删除,1:正常"
    t.text     "demo",             limit: 65535,              comment: "调用示例"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.index ["id"], name: "index_interfaces_on_id", using: :btree
    t.index ["interface_name", "status"], name: "ix_interface_name_status", using: :btree
  end

  create_table "members", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "sid",          limit: 50,               comment: "sid"
    t.string   "display_name", limit: 50,               comment: "显示名称"
    t.integer  "status",                                comment: "状态,0:删除,1:正常"
    t.datetime "expire_date",                           comment: "有效期"
    t.string   "memo",         limit: 100,              comment: "备注"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["display_name", "status"], name: "ix_display_name_status", using: :btree
    t.index ["id"], name: "index_members_on_id", using: :btree
  end

  create_table "permissions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer "interface_id", comment: "接口id"
    t.integer "member_id",    comment: "用户id"
    t.index ["interface_id", "member_id"], name: "ix_interface_id_member_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
