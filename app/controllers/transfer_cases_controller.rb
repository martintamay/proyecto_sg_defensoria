class TransferCasesController < ApplicationController
  before_action :set_transfer_case, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
 before_action :obtenerListado
  load_and_authorize_resource

  def index
    redirect_to :action => "new"     
  end
  def obtenerListado
    @transfer_cases = TransferCase.all
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
        format.html { render :new, notice: '' }
        format.json { render :new tatus: :created, location: @transfer_case }
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
        format.html { render :new, notice: '' }
        format.json { render :new, status: :ok, location: @transfer_case }
      else
        format.html { render :new }
        format.json { render json: @transfer_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transfer_cases/1
  # DELETE /transfer_cases/1.json
  def destroy
    @transfer_case.destroy
    respond_to do |format|
      format.html { render :new, notice: '' }
      format.json { head :no_content }
    end
  end

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
