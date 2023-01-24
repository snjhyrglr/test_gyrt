class ApplicationController < ActionController::Base
  devise_group :user, contains: [:employee, :agent]
  # before_action :check_logged_in
  before_action :authenticate_user!
  before_action :set_query

  authorize_resource unless: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_back(fallback_location: current_user, alert: "Sorry, you are not authorized to access that action or page.") }
    end
  end

  
  def set_query
    @query = Cooperative.ransack(params[:q])
  end
end
