class ApplicationController < ActionController::Base
  
  protect_from_forgery
  include SessionsHelper #this is a helper for checking sessions-tokens in different pages

end
