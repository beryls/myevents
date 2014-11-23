class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception

  # before_action :authenticate_user!

  # after_filter :set_csrf_cookie_for_ng

  # def set_csrf_cookie_for_ng
  #   cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  # end

  # def render_with_protection(json_content, parameters = {})
  #   render parameters.merge(content_type: 'application/json', text: ")]}',\n" + json_content)
  # end

  # rescue_from ActionController::InvalidAuthenticityToken do |exception|
  #   sign_out(current_user)
  #   cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  #   render :error => 'invalid token', {:status => :unprocessable_entity}
  # end

  # def current_user
  #   # Note: we want to use "find_by_id" because it's OK to return a nil.
  #   # If we were to use User.find, it would throw an exception if the user can't be found.
  #   @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  #   @current_user ||= User.find_by_authentication_token(cookies[:auth_token]) if   cookies[:auth_token] && @current_user.nil?
  #   @current_user
  # end

  # def authenticate_user!
  #   if @current_user.nil?
  #     flash[:error] = 'You must be signed in to view that page.'
  #     redirect_to '/login'
  #   end
  # end

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |type|
      type.all  { render :nothing => true, :status => 404 }
    end
  end

# protected

#   def verified_request?
#     super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
#   end
end
