class CriminalRecordsController < ApplicationController
  before_action :set_criminal_record, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
   before_action :obtenerListado
  load_and_authorize_resource

  def index
    redirect_to :action => "new"     
  end
  def obtenerListado
    @criminal_records = CriminalRecord.all
  end

  # GET /criminal_records/1
  # GET /criminal_records/1.json
  def show
  end

  # GET /criminal_records/new
  def new
    @criminal_record = CriminalRecord.new
  end

  # GET /criminal_records/1/edit
  def edit
  end

  # POST /criminal_records
  # POST /criminal_records.json
  def create
    @criminal_record = CriminalRecord.new(criminal_record_params)

    respond_to do |format|
      if @criminal_record.save
        format.html { render :new, notice: '' }
        format.json { render :new, status: :created, location: @criminal_record }
      else
        format.html { render :new }
        format.json { render json: @criminal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criminal_records/1
  # PATCH/PUT /criminal_records/1.json
  def update
    respond_to do |format|
      if @criminal_record.update(criminal_record_params)
        format.html { render :new, notice: '' }
        format.json { render :new, status: :ok, location: @criminal_record }
      else
        format.html { render :new }
        format.json { render json: @criminal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criminal_records/1
  # DELETE /criminal_records/1.json
  def destroy
    @criminal_record.destroy
    respond_to do |format|
      format.html { render :new, notice: '' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_criminal_record
      @criminal_record = CriminalRecord.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def criminal_record_params
      params.require(:criminal_record).permit(:procedural_stage, :inquire_number, :intervention_date, :type_of_crime, :commission_place, :commission_date, :prosecutor_unit, :precautionary_measures)
    end
end
