# encoding: utf-8

module Api
  module V1
    class ApiController < ApplicationController
      include Concerns::ActAsApiRequest
      include DeviseTokenAuth::Concerns::SetUserByToken
      include ApplicationHelper
      before_action :authenticate_user!, except: [:status, :send_mail]

      layout false
      respond_to :json

      rescue_from Exception,                           with: :render_error
      rescue_from ActiveRecord::RecordNotFound,        with: :render_not_found
      rescue_from ActiveRecord::RecordInvalid,         with: :render_record_invalid
      rescue_from ActionController::RoutingError,      with: :render_not_found
      rescue_from ActionController::UnknownController, with: :render_not_found
      rescue_from ActionController::BadRequest,        with: :render_bad_request
      rescue_from AbstractController::ActionNotFound,  with: :render_not_found
      rescue_from ActionController::ParameterMissing,  with: :render_params_missing

      def status
        render json: { online: true }
      end

      def render_error(exception)
        logger.error(exception) # Report to your error managment tool here
        render json: { error: 'An error ocurred' }, status: 500 unless performed?
      end

      def render_not_found(exception)
        logger.info(exception) # for logging
        render json: { error: "Couldn't find the record" }, status: :not_found
      end

      def render_record_invalid(exception)
        logger.info(exception) # for logging
        render json: { errors: exception.record.errors.as_json }, status: :bad_request
      end

      def render_bad_request(exception)
        logger.info(exception) # for logging
        render json: { errors: 'Invalid request' }, status: :bad_request
      end

      def render_params_missing(exception)
        logger.info(exception) # for logging
        render json: { error: exception.message }, status: :bad_request
      end

      def json_response(object, include = nil, status = :ok)
        render json: object, include: include, status: status
      end
    end
  end
end
