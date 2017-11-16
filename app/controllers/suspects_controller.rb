class SuspectsController < ApplicationController
  before_action :set_suspect, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :obtenerListado
  load_and_authorize_resource

  def index
    redirect_to :action => "new"     
  end
  def obtenerListado
    @suspects = Suspect.all
  end 

  # GET /suspects/1
  # GET /suspects/1.json
  def show
  end

  # GET /suspects/new
  def new
    @suspect = Suspect.new
    @suspect.entity = Entity.new
  end

  # GET /suspects/1/edit
  def edit
  end

  # POST /suspects
  # POST /suspects.json
  def create
    @suspect = Suspect.new(suspect_params)

    respond_to do |format|
      if @suspect.save
        format.html { render :new, notice: '' }
        format.json { render :new, status: :created, location: @suspect }
      else
        format.html { render :new }
        format.json { render json: @suspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suspects/1
  # PATCH/PUT /suspects/1.json
  def update
    respond_to do |format|
      if @suspect.update(suspect_params)
        format.html { render :new, notice: '' }
        format.json { render :new, status: :ok, location: @suspect }
      else
        format.html { render :new }
        format.json { render json: @suspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suspects/1
  # DELETE /suspects/1.json
  def destroy
    @suspect.destroy
    respond_to do |format|
      format.html { render :new, notice: '' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suspect
      @suspect = Suspect.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def suspect_params
      params.require(:suspect).permit(:ci, :reason, :mothers_name, :fathers_name, :criminal_record, :present_status, :nationality, :home_adress, entity_attributes: [:id, :name, :last_name, :phone, :birthdate, :email])
    end
end
