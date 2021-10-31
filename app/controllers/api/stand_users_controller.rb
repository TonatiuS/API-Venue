class Api::V1::StandUsersController < Api::V1::BaseController
  before_action :set_stand_user, only: [:show, :update, :destroy]

  # GET /stand_users
  def index
    @stand_users = StandUser.all

    render json: @stand_users
  end

  # GET /stand_users/1
  def show
    render json: @stand_user
  end

  # POST /stand_users
  def create
    @stand_user = StandUser.new(stand_user_params)

    if @stand_user.save
      render json: @stand_user, status: :created, location: @stand_user
    else
      render json: @stand_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stand_users/1
  def update
    if @stand_user.update(stand_user_params)
      render json: @stand_user
    else
      render json: @stand_user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /stand_users/1
  def destroy
    @stand_user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stand_user
      @stand_user = StandUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def stand_user_params
      params.require(:stand_user).permit(:contrato, :user_id)
    end
end
