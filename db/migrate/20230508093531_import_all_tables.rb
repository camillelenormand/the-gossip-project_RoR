class ImportAllTables < ActiveRecord::Migration[7.1]
  def change
    create_table "comments", force: :cascade do |t|
      t.integer "gossip_id"
      t.integer "author_id"
      t.string "parent_type"
      t.integer "parent_id"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["author_id"], name: "index_comments_on_author_id"
      t.index ["gossip_id"], name: "index_comments_on_gossip_id"
      t.index ["parent_type", "parent_id"], name: "index_comments_on_parent"
    end

    create_table "gossips", force: :cascade do |t|
      t.string "title"
      t.text "content"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer "user_id"
      t.index ["user_id"], name: "index_gossips_on_user_id"
    end

    create_table "join_table_gossip_tags", force: :cascade do |t|
      t.integer "tag_id"
      t.integer "gossip_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["gossip_id"], name: "index_join_table_gossip_tags_on_gossip_id"
      t.index ["tag_id"], name: "index_join_table_gossip_tags_on_tag_id"
    end

    create_table "likes", force: :cascade do |t|
      t.integer "gossip_id"
      t.integer "comment_id"
      t.integer "user_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["comment_id"], name: "index_likes_on_comment_id"
      t.index ["gossip_id"], name: "index_likes_on_gossip_id"
      t.index ["user_id"], name: "index_likes_on_user_id"
    end


  create_table "private_messages", force: :cascade do |t|
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "sender_id", null: false
    t.index ["sender_id"], name: "index_private_messages_on_sender_id"
  end

  create_table "recipients", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "private_message_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["private_message_id"], name: "index_recipients_on_private_message_id"
    t.index ["user_id"], name: "index_recipients_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "description"
    t.string "email"
    t.integer "age"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "city_id"
    t.index ["city_id"], name: "index_users_on_city_id"
  end

  add_foreign_key "comments", "gossips"
  add_foreign_key "comments", "users", column: "author_id"
  add_foreign_key "gossips", "users"
  add_foreign_key "join_table_gossip_tags", "gossips"
  add_foreign_key "join_table_gossip_tags", "tags"
  add_foreign_key "likes", "comments"
  add_foreign_key "likes", "gossips"
  add_foreign_key "likes", "users"
  add_foreign_key "private_messages", "users", column: "sender_id"
  add_foreign_key "recipients", "private_messages"
  add_foreign_key "recipients", "users"
  add_foreign_key "users", "cities"
  end
end
