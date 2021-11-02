class Api::EventsController < Api::BaseController
  before_action :ensure_and_set_current_user, only: [:update, :create]
  before_action :set_event, only: [:show, :update, :destroy]

  # GET /events
  def index
    @events = policy_scope(Event)
    render json: {event: @events}, each_serializer: EventSerializer, status: 200
  end

  # GET /events/1
  def show
    render json:  @event, serializer: EventSerializer, status: 200
  end

  # POST /events
  def create
    @event = Event.new(event_params)
    authorize @event
    if @event.save
      render json: {
        event: ActiveModelSerializers::Adapter::Json.new(EventSerializer.new(@event)).as_json,
        message: "Successfully create event",
      }, status: 200
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize @event

    if @event.update(event_params)
      render json: {
        event: ActiveModelSerializers::Adapter::Json.new(EventSerializer.new(@event)).as_json,
        message: "Successfully update event",
      }, status: 200
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  # DELETE /events/1
  def destroy
    @event.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = policy_scope(Event).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :limit, :description, :place_id, :date_venue, :venue_type, :active)
    end
end
