class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
        build_resource(sign_up_params)
        resource.save
        debugger
        render json: resource, status: :created
    end
end