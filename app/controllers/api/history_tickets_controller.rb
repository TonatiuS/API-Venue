class Api::V1::HistoryTicketsController < Api::V1::BaseController
  before_action :set_history_ticket, only: [:show, :update, :destroy]

  # GET /history_tickets
  def index
    @history_tickets = HistoryTicket.all

    render json: @history_tickets
  end

  # GET /history_tickets/1
  def show
    render json: @history_ticket
  end

  # POST /history_tickets
  def create
    @history_ticket = HistoryTicket.new(history_ticket_params)

    if @history_ticket.save
      render json: @history_ticket, status: :created, location: @history_ticket
    else
      render json: @history_ticket.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /history_tickets/1
  def update
    if @history_ticket.update(history_ticket_params)
      render json: @history_ticket
    else
      render json: @history_ticket.errors, status: :unprocessable_entity
    end
  end

  # DELETE /history_tickets/1
  def destroy
    @history_ticket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_history_ticket
      @history_ticket = HistoryTicket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def history_ticket_params
      params.require(:history_ticket).permit(:client_user_id, :ticket_id)
    end
end
