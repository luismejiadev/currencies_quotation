class ApplicationController < ActionController::Base
  before_action :require_login
  protect_from_forgery with: :exception
  before_action :set_global_settings

  def set_global_settings
    @global_decimal = "%.#{@global_truncate}f"
  end

  private
    def not_authenticated
      redirect_to main_app.login_path, alert: "Please login first"
    end
end
