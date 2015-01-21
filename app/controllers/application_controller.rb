class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

  # --------Filters--------

  # device OS detection. Class Variables will be used on views to define which CSS one should render
	def detect_mobile
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

end
