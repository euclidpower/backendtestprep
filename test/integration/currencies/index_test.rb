# frozen_string_literal: true

require 'test_helper'

module Currencies
  class IndexTest < ActionDispatch::IntegrationTest
    test 'missing api key' do
      params[:api_key] = nil

      get currencies_path

      assert_response :not_found
    end

    test 'can see currencies' do
      get currencies_path, params: params, as: :json

      assert_response :ok
      assert_equal 3, response.parsed_body.size
    end

    private

    def setup
      create_list :currency, 3
    end

    def params
      @params ||= { api_key: user.api_key }
    end

    def user
      @user ||= create :user
    end
  end
end
