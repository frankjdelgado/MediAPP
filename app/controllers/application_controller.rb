class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  # Get session user
  def current_user
    if session[:user]
      return session[:user]
    else
      return false
    end
  end

  # Validate user is auth
  def validate_user
    if current_user
      return true
    else
      redirect_to controller: :session, action: :login
    end
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
