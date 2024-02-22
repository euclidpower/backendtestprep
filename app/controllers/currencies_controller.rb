# frozen_string_literal: true

class CurrenciesController < AuthenticatedController
  def index
    @currencies = Currency.all
  end

  def create
    @currency = Currency.new currency_params

    render_unprocessable(@currency) unless @currency.save
  end

  private

  def currency_params
    params.permit(:name, :code)
  end
end
