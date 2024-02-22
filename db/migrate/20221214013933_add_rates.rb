# frozen_string_literal: true

class AddRates < ActiveRecord::Migration[7.0]
  def change
    create_table :rates do |t|
      t.references :base, foreign_key: { to_table: :currencies, on_delete: :cascade }, index: true, null: false
      t.references :target, foreign_key: { to_table: :currencies, on_delete: :cascade }, index: true, null: false
      t.decimal :amount, precision: 15, scale: 6, null: false

      t.timestamps
    end
  end
end
