class CourtsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_court, only: [:show, :edit, :update, :destroy]
  before_action :obtenerListado, only: [:index, :new, :edit, :show, :update]
  load_and_authorize_resource

  # GET /courts
  # GET /courts.json
  def index
  end

  # GET /courts/1
  # GET /courts/1.json
  def show
  end

  # GET /courts/new
  def new
    @court = Court.new
  end

  # GET /courts/1/edit
  def edit
  end

  # POST /courts
  # POST /courts.json
  def create
    @court = Court.new(court_params)

    respond_to do |format|
      if @court.save
        format.html { redirect_to courts_url, notice: 'Juzgado creado' }
        format.json { render :show, status: :created, location: @court }
      else
        format.html { render :new }
        format.json { render json: @court.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courts/1
  # PATCH/PUT /courts/1.json
  def update
    respond_to do |format|
      if @court.update(court_params)
        format.html { redirect_to courts_url, notice: 'Juzgado Modificado' }
        format.json { render :show, status: :ok, location: @court }
      else
        format.html { render :edit }
        format.json { render json: @court.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courts/1
  # DELETE /courts/1.json
  def destroy
    jueces= Judge.all().where(court: @court);
    if jueces.length()>0
      respond_to do |format|
        format.html { redirect_to courts_url, alert: 'El juzgado no puede ser eliminado porque tiene al menos un juez' }
        format.json { render json: @court.errors, status: :unprocessable_entity }
      end
    else
      @court.destroy
      respond_to do |format|
        format.html { redirect_to courts_url, notice: 'El Juzgado Fue Eliminado' }
        format.json { head :no_content }
      end
    end
  end

  private
    def obtenerListado
      @courts = Court.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_court
      @court = Court.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def court_params
      params.require(:court).permit(:name, :phone, :address)
    end
end
