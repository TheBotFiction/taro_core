# frozen_string_literal: true

class CreateJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :phrases, :terms do |t|
      t.index [:phrase_id, :term_id], unique: true
      t.index [:term_id, :phrase_id], unique: true
    end
  end
end
