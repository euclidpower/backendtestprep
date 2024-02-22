# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def render_unprocessable(model)
    render json: { errors: model.errors.as_json(full_messages: true) }, status: :unprocessable_entity
  end
end
