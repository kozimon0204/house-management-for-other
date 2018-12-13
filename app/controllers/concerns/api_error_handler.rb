module APIErrorHandler
  extend ActiveSupport::Concern
  included do

    rescue_from ActionController::ParameterMissing do |e|
      error_response(nil, e.param, nil, :bad_request)
    end

    rescue_from ActionController::UnpermittedParameters do |e|
      error_response(nil, e.param, nil, :bad_request)
    end

    # Common
    rescue_from ActiveRecord::RecordInvalid do |e|
      error_response(e, nil, nil, :not_found)
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error_response(e, nil, nil, :not_found)
    end

    rescue_from NoMethodError do |e|
      Rails.logger.error("Internal server error occurred.")
      Rails.logger.error("  type: #{e.class.name}")
      Rails.logger.error("  message: #{e.message}")
      Rails.logger.error("  backtrace:")
      Rails.logger.error("    " + e.backtrace.join("\n    "))
      error_response('internal_server_error', :internal_server_error, nil, :internal_server_error)
    end

  end

  private

  def error_response(message, contents, code, status)
      render json: { errors: { message: message, contents: contents, code: code}}, status: status

  end
end
