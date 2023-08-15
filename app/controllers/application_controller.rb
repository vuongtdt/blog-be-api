class ApplicationController < ActionController::API
  rescue_from CanCan::AccessDenied do |exception|
    render json: { error: "No access permission." }, status: :forbidden
  end
end
