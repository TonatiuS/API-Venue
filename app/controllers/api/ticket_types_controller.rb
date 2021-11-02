class Api::TicketTypesController < Api::BaseController
  before_action :ensure_and_set_current_user, only: [:update, :create]
  before_action :set_ticket_type, only: [:show, :update, :destroy]

  # GET /ticket_types
  def index
    @ticket_types = policy_scope(TicketType)
    render json: {ticket_type: @ticket_types}, each_serializer: TicketTypeSerializer, status: 200
  end

  # GET /ticket_types/1
  def show
    render json: @ticket_types, each_serializer: TicketTypeSerializer, status: 200
  end

  # POST /ticket_types
  def create
    @ticket_type = TicketType.new(ticket_type_params)
    authorize @ticket_type

    if @ticket_type.save
      render json: {
        ticket_type: ActiveModelSerializers::Adapter::Json.new(TicketTypeSerializer.new(@ticket_type)).as_json,
        message: "Successfully create ticket type",
      }, status: 200
    else
      render json: @ticket_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ticket_types/1
  def update
    authorize @ticket_type
    if @ticket_type.update(ticket_type_params)
      render json: {
        ticket_type: ActiveModelSerializers::Adapter::Json.new(TicketTypeSerializer.new(@ticket_type)).as_json,
        message: "Successfully create ticket type",
      }, status: 200    else
      render json: @ticket_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /ticket_types/1
  def destroy
    @ticket_type.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket_type
      @ticket_type = policy_scope(TicketType).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_type_params
      params.require(:ticket_type).permit(:type, :total_limit, :total_leftover, :event_id, :cost)
    end
end
