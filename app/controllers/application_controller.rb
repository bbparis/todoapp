class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  def hello
      render plain: "Hello World!, the time now is #{Time.now}"
  end
  
end
