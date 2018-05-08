class ApplicationController < ActionController::API
  include Response
  include Rescue

  include ActionController::HttpAuthentication::Token::ControllerMethods
end
