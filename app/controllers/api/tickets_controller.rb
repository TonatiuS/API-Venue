class Api::TicketsController < Api::BaseController
  before_action :ensure_and_set_current_user, only: [:update, :create]
  before_action :set_ticket, only: [:show, :update, :destroy]

  # GET /tickets
  def index
    @tickets = policy_scope(Ticket)

    render json: {ticket: @tickets}, each_serializer: TicketSerializer, status: 200
  end

  # GET /tickets/1
  def show
    render json:  @ticket, serializer: TicketSerializer, status: 200
  end

  # POST /tickets
  def create
    @ticket = Ticket.new(ticket_params)
    debugger
    if @ticket.save
      render json: {
        ticket: ActiveModelSerializers::Adapter::Json.new(TicketSerializer.new(@ticket)).as_json,
        message: "Successfully create ticket ",
      }, status: 200
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tickets/1
  def update
    authorize @ticket
    if @ticket.update(ticket_params)
      render json: {
        ticket: ActiveModelSerializers::Adapter::Json.new(TicketSerializer.new(@ticket)).as_json,
        message: "Successfully update ticket ",
      }, status: 200
    else
      render json: @ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tickets/1
  def destroy
    @ticket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = policy_scope(Ticket).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:folio, :logo, :people, :total, :cupon_id, :ticket_type_id, :event_id)
    end
end
