class Api::BaseController < ActionController::API
  include Pundit
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from Pundit::NotAuthorizedError, with: :not_found


  def pundit_user
    @current_user
  end

  protected

  def ensure_and_set_current_user
    authenticate = AuthenticationService::GetUser.new(request.headers['Authorization']).call
    if authenticate.success?
      @current_user = authenticate.result
    elsif current_user
      @current_user = current_user
    else
      render_not_found
    end
  end

  def only_admin
    p @current_user
    render_not_found unless @current_user&.admin?
    true
  end

  def argument_error(message)
    render json: {
      status: "error",
      message: "An error occurred: Invalid argument.",
      errors: message,
    }, status: :unprocessable_entity
  end

  private

  def not_found(exception)
    render_not_found
  end

  def render_not_found
    render json: { status: "error", message: "Resource not found" }, status: :not_found
  end


end
