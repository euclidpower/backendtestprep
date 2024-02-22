# frozen_string_literal: true

class Currency < ApplicationRecord
  validates :name, presence: true, length: { maximum: 255 }
  validates :code, presence: true, currency_code: true, uniqueness: { case_sensitive: false }
end
