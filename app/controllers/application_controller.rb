class ApplicationController < ActionController::Base
  include Pundit::Authorization
  before_action :authenticate_employee!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def pundit_user
    current_employee
  end

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_back(fallback_location: root_path)
  end
end
