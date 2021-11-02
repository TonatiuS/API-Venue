class Api::CuponsController < Api::BaseController
  before_action :ensure_and_set_current_user
  before_action :only_admin
  before_action :set_cupon, only: [:show, :update, :destroy]

  # GET /cupons
  def index
    @cupons = Cupon.all

    render json: @cupons
  end

  # GET /cupons/1
  def show
    render json: @cupon
  end

  # POST /cupons
  def create
    @cupon = Cupon.new(cupon_params)

    if @cupon.save
      render json: @cupon, status: :created
    else
      render json: @cupon.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cupons/1
  def update
    if @cupon.update(cupon_params)
      render json: @cupon
    else
      render json: @cupon.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cupons/1
  def destroy
    @cupon.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cupon
      @cupon = Cupon.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cupon_params
      params.require(:cupon).permit(:code, :average, :total)
    end
end
