# frozen_string_literal: true

class AuthenticatedController < ApplicationController
  class NotAuthorized < StandardError; end

  before_action :authorize

  rescue_from NotAuthorized, with: :render_forbidden

  private

  def authorize
    raise NotAuthorized unless User.exists?(api_key: params[:api_key])
  end

  def render_forbidden
    render_not_found
  end

  def render_not_found
    head :not_found
  end
end
