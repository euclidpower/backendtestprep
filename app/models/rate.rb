# frozen_string_literal: true

class Rate < ApplicationRecord
  belongs_to :base, class_name: 'Currency'
  belongs_to :target, class_name: 'Currency'

  validates :amount, presence: true, numericality: { greater_than: 0 }
end
