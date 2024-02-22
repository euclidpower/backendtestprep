# frozen_string_literal: true

require 'test_helper'

class CurrencyTest < ActiveSupport::TestCase
  test 'factory' do
    assert_predicate build(:currency), :valid?
  end

  test 'nil name' do
    assert_not_predicate build(:currency, name: nil), :valid?
  end

  test 'blank name' do
    assert_not_predicate build(:currency, name: ''), :valid?
  end

  test 'long name' do
    assert_not_predicate build(:currency, name: 'a' * (255 + 1)), :valid?
  end

  test 'nil code' do
    assert_not_predicate build(:currency, code: nil), :valid?
  end

  test 'blank code' do
    assert_not_predicate build(:currency, code: ''), :valid?
  end

  test 'short code' do
    assert_not_predicate build(:currency, code: 'A' * (3 - 1)), :valid?
  end

  test 'long code' do
    assert_not_predicate build(:currency, code: 'A' * (3 + 1)), :valid?
  end

  test 'malformed code' do
    assert_not_predicate build(:currency, code: '?a3'), :valid?
  end

  test 'duplicate code' do
    currency = create :currency

    assert_not_predicate build(:currency, code: currency.code), :valid?
  end
end
