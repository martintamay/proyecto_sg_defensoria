class CriminalRecordsController < ApplicationController
  before_action :set_criminal_record, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /criminal_records
  # GET /criminal_records.json
  def index
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
        format.html { redirect_to criminal_records_url, notice: 'Criminal record was successfully created.' }
        format.json { render :show, status: :created, location: @criminal_record }
      else
        format.html { render :new }
        format.json { render json: @criminal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /criminal_records/
  # PATCH/PUT s_url/criminal_records/1.json
  def update
    respond_to do |format|
      if @criminal_record.update(criminal_record_params)
        format.html { redirect_to criminal_records_url, notice: 'Criminal record was successfully updated.' }
        format.json { render :show, status: :ok, location: @criminal_record }
      else
        format.html { render :edit }
        format.json { render json: @criminal_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /criminal_records/1
  # DELETE /criminal_records/1.json
  def destroy
    casos= LegalCase.all().where(criminal_record: @criminal_record);
    if casos.length>0
      respond_to do |format|
      format.html { redirect_to criminal_records_url, notice: 'Esta ficha penal esta en un caso y no se puede eliminar' }
    end
else
    @criminal_record.destroy
    respond_to do |format|
      format.html { redirect_to criminal_records_url, notice: 'Esta ficha penal fue eliminada' }
      format.json { head :no_content }
    end
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
