# frozen_string_literal: true

require 'test_helper'

module Conversions
  class CreateTest < ActionDispatch::IntegrationTest
    def setup
      rate
    end

    test 'valid params' do
      post conversions_path, params: params, as: :json

      assert_response :ok
      assert_equal '50.000000', response.parsed_body['result']
    end

    private

    def user
      @user ||= create :user
    end

    def from_currency
      @from_currency ||= create :currency
    end

    def to_currency
      @to_currency ||= create :currency
    end

    def rate
      rate ||= create :rate, base: from_currency, target: to_currency, amount: 2
    end

    def params
      @params ||= { api_key: user.api_key, from: from_currency.code, to: to_currency.code, amount: 25 }
    end
  end
end