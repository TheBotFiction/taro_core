# frozen_string_literal: true

class CreateMTerms < ActiveRecord::Migration[5.2]
  def change
    create_table :m_terms do |t|
      t.string  :term
      t.string  :meaning
      t.string  :spelling
      t.integer :gid
      t.string  :level
      t.bigint  :shuffling, default: 0

      t.timestamps
    end
    add_index :m_terms, :term
    add_index :m_terms, :meaning
    add_index :m_terms, :spelling
    add_index :m_terms, :gid
    add_index :m_terms, :level
    add_index :m_terms, :shuffling
  end
end
