# frozen_string_literal: true

class CreateTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :terms do |t|
      t.string  :term
      t.string  :meaning
      t.string  :spelling
      t.integer :gid
      t.string  :level
      t.bigint  :shuffling, default: 0

      t.timestamps null: false
    end
    add_index :terms, :term
    add_index :terms, :meaning
    add_index :terms, :spelling
    add_index :terms, :gid
    add_index :terms, :level
    add_index :terms, :shuffling
  end
end
