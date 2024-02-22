# frozen_string_literal: true

require 'test_helper'

module Currencies
  class CreateTest < ActionDispatch::IntegrationTest
    test 'nil api key' do
      params[:api_key] = nil

      post currencies_path, params: params, as: :json

      assert_response :not_found
    end

    test 'unauthentic api_key' do
      params[:api_key] = SecureRandom.hex 12

      post currencies_path, params: params, as: :json

      assert_response :not_found
    end

    test 'nil name' do
      params[:name] = nil

      post currencies_path, params: params, as: :json

      assert_response :unprocessable_entity
    end

    test 'invalid name' do
      params[:name] = 'a' * (255 + 1)

      post currencies_path, params: params, as: :json

      assert_response :unprocessable_entity
    end

    test 'nil code' do
      params[:code] = nil

      post currencies_path, params: params, as: :json

      assert_response :unprocessable_entity
    end

    test 'invalid code' do
      params[:code] = 'a' * (7 + 1)

      post currencies_path, params: params, as: :json

      assert_response :unprocessable_entity
    end

    test 'duplicate code' do
      currency = create :currency

      params[:code] = currency.code

      post currencies_path, params: params, as: :json

      assert_response :unprocessable_entity
    end

    test 'valid params' do
      post currencies_path, params: params, as: :json

      assert_response :ok
    end

    private

    def user
      @user ||= create :user
    end

    def currency
      @currency ||= build :currency
    end

    def params
      @params ||= { name: currency.name, code: currency.code, api_key: user.api_key }
    end
  end
end
