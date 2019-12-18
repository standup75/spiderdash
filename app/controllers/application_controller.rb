class ApplicationController < ActionController::Base
  after_filter :set_access_control_headers
  protect_from_forgery

  def login_required(roles)
    msg = 'Please login to perform this action.'
    return true if current_user_is(roles)
    msg = "You don't have access to this area." if session[:user_id]
    respond_to do |format|
      format.html {
        flash[:warning]=msg
        session[:return_to]=request.fullpath
        redirect_to new_session_path
      }
      format.json {
        render :json => {:error => msg }
      }
    end
  end

  def redirect_to_stored
    if return_to = session[:return_to]
      session[:return_to] = nil
      redirect_to return_to
    else
      redirect_to root_path
    end
  end
  
  private

  def set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Request-Method'] = '*'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def current_user_is(roles)
    session[:user_id] && User.find(session[:user_id]).send("is_#{roles}?")
  end

  helper_method :current_user, :current_user_is
end
