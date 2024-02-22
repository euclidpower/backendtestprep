# frozen_string_literal: true

class AddUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, limit: 255, null: false
      t.string :api_key, limit: 255, null: false

      t.timestamps
    end

    add_index :users, :api_key, unique: true
  end
end
