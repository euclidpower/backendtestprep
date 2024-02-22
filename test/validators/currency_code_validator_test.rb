# frozen_string_literal: true

require 'test_helper'

class CurrencyCodeValidatorTestCase
  include ActiveModel::Validations

  attr_accessor :code

  validates :code, currency_code: true
end

class CurrencyCodeValidatorTest < ActiveSupport::TestCase
  test 'nil code' do
    assert_valid_code nil
  end

  test 'blank code' do
    assert_not_valid_code ''
  end

  test 'invalid code' do
    assert_not_valid_code 'a123b'
  end

  test 'unauthentic code' do
    assert_not_valid_code 'foo'
  end

  test 'valid code' do
    currency = create :currency

    assert_valid_code currency.code
  end

  private

  def record
    @record ||= CurrencyCodeValidatorTestCase.new
  end

  def assert_valid_code(value)
    record.code = value

    assert_predicate record, :valid?
  end

  def assert_not_valid_code(value)
    record.code = value

    assert_not_predicate record, :valid?
  end
end
