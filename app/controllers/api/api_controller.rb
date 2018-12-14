module Api
  class ApiController < ActionController::Base
    protect_from_forgery with: :exception
    # include DeviseTokenAuth::Concerns::SetUserByToken
    include APIErrorHandler

  end
end