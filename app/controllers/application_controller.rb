class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_global_settings

  def set_global_settings
    @global_decimal = "%.#{@global_truncate}f"
  end
end
