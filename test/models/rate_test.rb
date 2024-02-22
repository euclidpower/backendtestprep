# frozen_string_literal: true

require 'test_helper'

class RateTest < ActiveSupport::TestCase
  test 'factory' do
    assert_predicate build(:rate), :valid?
  end

  test 'nil amount' do
    assert_not_predicate build(:rate, amount: nil), :valid?
  end

  test 'blank amount' do
    assert_not_predicate build(:rate, amount: ''), :valid?
  end

  test 'negative amount' do
    assert_not_predicate build(:rate, amount: -1), :valid?
  end

  test 'zero amount' do
    assert_not_predicate build(:rate, amount: 0), :valid?
  end

  test 'integer amount' do
    assert_predicate build(:rate, amount: 1), :valid?
  end

  test 'decimal amount' do
    assert_predicate build(:rate, amount: 1.0), :valid?
  end
end
