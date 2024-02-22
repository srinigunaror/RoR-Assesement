# frozen_string_literal: true

class ApplicationController < ActionController::API
  rescue_from ::ActiveRecord::RecordNotFound, with: :record_not_found


  def record_not_found(exception)
    render json: {error: exception.message}.to_json, status: 404
  end

  def render_error(resource, status)
    render json: resource.errors, status: status
  end	
end
