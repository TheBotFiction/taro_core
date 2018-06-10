# frozen_string_literal: true

class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.string :uid
      t.string :first_name
      t.string :last_name
      t.text :raw_data

      t.timestamps
    end
    add_index :recipients, :uid, unique: true
  end
end
