class SessionsController < Devise::RegistrationsController
    respond_to :json

    # private

    # def respond_with(resource, _opts = {})
    #     debugger
    #     render json: resource
    # end

    # def respond_to_on_destroy
    #     head :no_content
    # end

    def create
      authenticate = AuthenticationService::Authenticate.new( user_params[:email],  user_params[:password]).call
      if authenticate.success?
        render json: authenticate.result, serializer: LoginSerializer, status: :created
      else
        render(json: {
          status: 'error',
          errors: authenticate.errors,
          message: 'An error ocurred',
        }, status: :unauthorized)
      end
    end
    
    def destroy
      sign_out 
    end
      private
    
      def user_params
        params.permit(:email, :password)
      end

      def respond_to_on_destroy
        head :no_content
      end
end