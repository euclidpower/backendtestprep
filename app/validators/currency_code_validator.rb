# frozen_string_literal: true

class CurrencyCodeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.nil? || (value.present? && valid?(value))

    record.errors.add(attribute, :invalid, message: (options[:message] || 'is not a valid currency code'))
  end

  private

  def valid?(value)
    value =~ /\A[A-Z]{3}\z/o
  end
end
