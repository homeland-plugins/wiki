class CreatePages < ActiveRecord::Migration[5.0]
  def up
    return if ActiveRecord::Base.connection.table_exists? :pages

    create_table :pages do |t|
      t.string  :slug, null: false
      t.string  :title, null: false
      t.text    :body, null: false
      t.boolean :locked,         default: false
      t.integer :version,        default: 0,     null: false
      t.integer :editor_ids,     default: [],    null: false, array: true
      t.integer :word_count,     default: 0,     null: false
      t.integer :changes_cout,   default: 1,     null: false
      t.integer :comments_count, default: 0,     null: false
      t.datetime :deleted_at

      t.timestamps
    end

    add_index :pages, :slug, unique: true
  end

  def down
    drop_table :pages, if_exists: true
  end
end
