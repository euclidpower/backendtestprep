# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create name: 'Nancy'

currencies = Currency.create [
  { name: 'US Dollar', code: 'USD' },
  { name: 'Euro', code: 'EUR' }
]

Rate.create base: currencies.first, target: currencies.last, amount: 0.94
Rate.create base: currencies.last, target: currencies.first, amount: 1.06
