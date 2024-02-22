# frozen_string_literal: true

class AddCurrencies < ActiveRecord::Migration[7.0]
  def change
    create_table :currencies do |t|
      t.string :name, limit: 255, null: false
      t.string :code, limit: 7, null: false

      t.timestamps
    end

    add_index :currencies, :code, unique: true
  end
end
