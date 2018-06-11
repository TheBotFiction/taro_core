# frozen_string_literal: true

class CreatePhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :phrases do |t|
      t.references :recipient, foreign_key: true

      t.string  :term
      t.string  :meaning
      t.string  :spelling
      t.integer :gid
      t.string  :level
      t.bigint  :shuffling, default: 0

      t.timestamps null: false
    end

    add_index :phrases, :term
    add_index :phrases, :meaning
    add_index :phrases, :spelling
    add_index :phrases, :gid
    add_index :phrases, :level
    add_index :phrases, :shuffling
  end
end
