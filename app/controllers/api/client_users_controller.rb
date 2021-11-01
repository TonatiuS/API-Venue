class Api::ClientUsersController < Api::BaseController
  before_action :ensure_and_set_current_user
  before_action :set_client_user, only: [:show, :update, :destroy]

  # GET /client_users
  def index
    @client_users = ClientUser.all

    render json: @client_users
  end

  # GET /client_users/1
  def show
    render json: @client_user
  end

  # POST /client_users
  def create
    @client_user = ClientUser.new(client_user_params)

    if @client_user.save
      render json: @client_user, status: :created, location: @client_user
    else
      render json: @client_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /client_users/1
  def update
    if @client_user.update(client_user_params)
      render json: @client_user
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
      @client_user = ClientUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def client_user_params
      params.require(:client_user).permit(:card, :date_card, :cv, :history_ticket_id, :user_id)
    end
end
