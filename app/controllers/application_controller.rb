class ApplicationController < ActionController::API

rescue_from ActiveRecord::RecordNotFound, with: :not_found
rescue_from ActiveRecord::RecordInvalid, with: :invalid_input

    private

    def not_found(error)
        render json: {error: "#{error.model} not found"}, status: :not_found
    end

    def invalid_input(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
