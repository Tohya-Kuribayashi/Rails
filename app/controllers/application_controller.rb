class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger
end

private
def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation)
end
