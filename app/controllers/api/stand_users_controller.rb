class Api::StandUsersController < Api::BaseController
  before_action :ensure_and_set_current_user
  before_action :only_admin
  before_action :set_stand_user, only: [:show, :update, :destroy]

  # GET /stand_users
  def index
    @stand_users = StandUser.all

    render json: {stand_user: @stand_users}, each_serializer: StandUserSerializer, status: 200
  end

  # GET /stand_users/1
  def show
    render json:  @stand_user, each_serializer: StandUserSerializer, status: 200
  end

  # POST /stand_users
  def create
    @stand_user = StandUser.new(stand_user_params)

    if @stand_user.save
      render json: {
        stand_user: ActiveModelSerializers::Adapter::Json.new(StandUserSerializer.new(@stand_user)).as_json,
        message: "Successfully create stand user",
      }, status: 200
    else
      render json: @stand_user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /stand_users/1
  def update
    if @stand_user.update(stand_user_params)
      render json: {
        stand_user: ActiveModelSerializers::Adapter::Json.new(StandUserSerializer.new(@stand_user)).as_json,
        message: "Successfully create stand user",
      }, status: 200    else
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
