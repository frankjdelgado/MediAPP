class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Get session user
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  # Validate user session
  def validate_user
    redirect_to '/' unless current_user
  end

  def validate_session
    redirect_to '/treatment' if current_user
  end

  protected

  # --------Filters--------

  # device OS detection. Class Variables will be used on views to define which CSS one should render
  def detect_mobile
    case request.user_agent
    when /Mobile/
      case request.user_agent
      when /iPhone/
        @iphone = true
      when /Android/
        @android = true
      when /Windows Phone/
        @windows = true
      end
    end
    unless @iphone || @android || @windows
      @android = true
    end
  end
end
