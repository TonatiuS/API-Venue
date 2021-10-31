class Api::V1::TicketTypesController < Api::V1::BaseController
  before_action :set_ticket_type, only: [:show, :update, :destroy]

  # GET /ticket_types
  def index
    @ticket_types = TicketType.all

    render json: @ticket_types
  end

  # GET /ticket_types/1
  def show
    render json: @ticket_type
  end

  # POST /ticket_types
  def create
    @ticket_type = TicketType.new(ticket_type_params)

    if @ticket_type.save
      render json: @ticket_type, status: :created, location: @ticket_type
    else
      render json: @ticket_type.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /ticket_types/1
  def update
    if @ticket_type.update(ticket_type_params)
      render json: @ticket_type
    else
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
      @ticket_type = TicketType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_type_params
      params.require(:ticket_type).permit(:type, :total_limit, :total_leftover, :event_id, :cost)
    end
end
