class RegistrationsController < Devise::RegistrationsController
    respond_to :json

    def create
        build_resource(sign_up_params)
        resource.save
        resource.update(name:  params[:registration][:user][:name])
        render json: resource, serializer: SignUpSerializer, status: :created

    end
end