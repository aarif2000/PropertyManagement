# frozen_string_literal: true

class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
    render json: {message: "You are not authorised to perform this action" }, status: 401
  end
  include Pagy::Backend 
end