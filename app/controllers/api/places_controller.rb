class Api::PlacesController < Api::BaseController
  before_action :ensure_and_set_current_user
  before_action :only_admin
  before_action :set_place, only: [:show, :update, :destroy]

  # GET /places
  def index
    @places = policy_scope(Place)
    render json: {places: @places}, each_serializer: PlaceSerializer, status: 200
  end

  # GET /places/1
  def show
    render json:  @place, serializer: PlaceSerializer, status: 200
  end

  # POST /places
  def create
    @place = Place.new(place_params)

    if @place.save
      render json: {
        place: ActiveModelSerializers::Adapter::Json.new(PlaceSerializer.new(@place)).as_json,
        message: "Successfully create venue",
      }, status: 200
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /places/1
  def update
    if @place.update(place_params)
      render json: {
        place: ActiveModelSerializers::Adapter::Json.new(PlaceSerializer.new(@place)).as_json,
        message: "Successfully update venue",
      }, status: 200
    else
      render json: @place.errors, status: :unprocessable_entity
    end
  end

  # DELETE /places/1
  def destroy
    @place.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = policy_scope(Place).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def place_params
      params.require(:place).permit(:adress, :name, :state_id)
    end
end
