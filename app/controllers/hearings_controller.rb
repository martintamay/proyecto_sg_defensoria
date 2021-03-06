  class HearingsController < ApplicationController
  before_action :set_hearing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  load_and_authorize_resource

  def index
    @hearings = Hearing.all    
  end
      def reporte
     @hearings = Hearing.all  
  end

  # GET /hearings/1
  # GET /hearings/1.json
  def show
  
end
  # GET /hearings/new
  def new
    @hearing = Hearing.new
  end

  # GET /hearings/1/edit
  def edit
  end

  # POST /hearings
  # POST /hearings.json
  def create
    @hearing = Hearing.new(hearing_params)

    respond_to do |format|
      if @hearing.save
        format.html { redirect_to @hearing, notice: 'Se ha creado una Audiencia' }
        format.json { render :new, status: :created, location: @hearing }
      else
        format.html { redirect_to @hearing }
        format.json { render json: @hearing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hearings/1
  # PATCH/PUT /hearings/1.json
  def update
    respond_to do |format|
      if @hearing.update(hearing_params)
        format.html { redirect_to :@hearing , notice: 'Audiencia Modificada' }
        format.json { render :new, status: :ok, location: @hearing }
      else
        format.html { redirect_to :@hearing }
        format.json { render json: @hearing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hearings/1
  # DELETE /hearings/1.json
  def destroy
    @hearing.destroy
    respond_to do |format|
      format.html { redirect_to :@hearing, notice: 'Se ha eliminado una Audiencia' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hearing
      @hearing = Hearing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hearing_params
      params.require(:hearing).permit(:hearing_date, :user_id, :legal_case_id)
    end
  end

