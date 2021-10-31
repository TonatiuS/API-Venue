class RegistrationsController < Devise::SessionsController
    respond_to :json

    def create
        build_resource(sign_up_params)
        resource.save
        render json: resource, status: :created
    end
end