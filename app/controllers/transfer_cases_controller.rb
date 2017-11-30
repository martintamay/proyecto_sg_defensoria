class TransferCasesController < ApplicationController
  before_action :set_transfer_case, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /transfer_cases
  # GET /transfer_cases.json
  def index
    @transfer_cases = TransferCase.all
  end
    def reporte_completo_transfer
     @transfers = TransferCase.all
  end
  # GET /transfer_cases/1
  # GET /transfer_cases/1.json
  def show
  end

  # GET /transfer_cases/new
  def new
    @transfer_case = TransferCase.new
  end

  # GET /transfer_cases/1/edit
  def edit
  end

  # POST /transfer_cases
  # POST /transfer_cases.json
  def create
    @transfer_case = TransferCase.new(transfer_case_params)

    respond_to do |format|
      if @transfer_case.save

         UserMailer.notificar("Notificaion de caso", "se le ha transferido un caso", @legal_case).deliver()
        format.html { redirect_to @transfer_case, notice: 'Transfer case was successfully created.' }

        format.json { render :show, status: :created, location: @transfer_case }
      else
        format.html { render :new }
        format.json { render json: @transfer_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfer_cases/1
  # PATCH/PUT /transfer_cases/1.json
  def update
    respond_to do |format|
      if @transfer_case.update(transfer_case_params)
        format.html { redirect_to @transfer_case, notice: 'Transferencia de Caso Modificado' }
        format.json { render :show, status: :ok, location: @transfer_case }
      else
        format.html { render :edit }
        format.json { render json: @transfer_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # No se puede eliminar una transferencia
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer_case
      @transfer_case = TransferCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transfer_case_params
      params.require(:transfer_case).permit(:user_id, :legal_case_id, :comentary, :date_ttransfer)
    end
end
