class Api::DateVenuesController < Api::BaseController
  before_action :ensure_and_set_current_user, only: [:update, :create]
  before_action :only_admin,  only: [:update, :create]
  before_action :set_date_venue, only: [:show, :update, :destroy]

  # GET /date_venues
  def index
    @date_venues = DateVenue.all

    render json: @date_venues
  end

  # GET /date_venues/1
  def show
    render json: @date_venue
  end

  # POST /date_venues
  def create
    @date_venue = DateVenue.new(date_venue_params)

    if @date_venue.save
      render json: @date_venue, status: :created, location: @date_venue
    else
      render json: @date_venue.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /date_venues/1
  def update
    if @date_venue.update(date_venue_params)
      render json: @date_venue
    else
      render json: @date_venue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /date_venues/1
  def destroy
    @date_venue.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_venue
      @date_venue = DateVenue.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def date_venue_params
      params.require(:date_venue).permit(:date_venue, :availability)
    end
end
