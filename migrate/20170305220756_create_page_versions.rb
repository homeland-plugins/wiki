# frozen_string_literal: true

class CreatePageVersions < ActiveRecord::Migration[5.0]
  def up
    return if ActiveRecord::Base.connection.table_exists? :page_versions

    create_table 'page_versions', force: :cascade do |t|
      t.integer  'user_id',                null: false
      t.integer  'page_id',                null: false
      t.integer  'version', default: 0, null: false
      t.string   'slug',                   null: false
      t.string   'title',                  null: false
      t.text     'desc',                   null: false
      t.text     'body',                   null: false
      t.datetime 'created_at'
      t.datetime 'updated_at'
    end

    add_index 'page_versions', %w[page_id version], name: 'index_page_versions_on_page_id_and_version', using: :btree
    add_index 'page_versions', ['page_id'], name: 'index_page_versions_on_page_id', using: :btree
  end

  def down
    drop_table :page_versions, if_exists: true
  end
end
