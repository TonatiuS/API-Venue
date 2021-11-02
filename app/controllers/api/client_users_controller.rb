class Api::ClientUsersController < Api::BaseController
  before_action :ensure_and_set_current_user
  before_action :set_client_user, only: [:show, :update, :destroy]

  # GET /client_users
  def index
    @client_users = policy_scope(ClientUser)
    authorize @client_users
    render json: {client_user: @client_users}, each_serializer: ClientUserSerializer, status: 200
  end

  # GET /client_users/1
  def show
    authorize @client_user
    render json: @client_user, serializer: ClientUserSerializer, status: 200
  end

  # POST /client_users
  def create
    @client_user = ClientUser.new(client_user_params)
    authorize @client_user

    if @client_user.save
      render json: {
        client_user: ActiveModelSerializers::Adapter::Json.new(ClientUserSerializer.new(@client_user)).as_json,
        message: "Successfully create client user",
      }, status: 200
    else
      render json: @client_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_users/1
  def update
    authorize @client_user
    if @client_user.update(client_user_params)
      render json: {
        ticket_request: ActiveModelSerializers::Adapter::Json.new(ClientUserSerializer.new(@client_user)).as_json,
        message: "Successfully update client_user",
      }, status: 200
    else
      render json: @client_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /client_users/1
  def destroy
    @client_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client_user
      @client_user = policy_scope(ClientUser).find(params[:id])
      if @client_user.nil?
        render json:{
          "message": "not found client_user with id: #{params[:id]}"
        }
      end
      
    end

    # Only allow a list of trusted parameters through.
    def client_user_params
      params.require(:client_user).permit(:card, :date_card, :cv, :history_ticket_id, :user_id)
    end
end
