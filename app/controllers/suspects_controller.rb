class SuspectsController < ApplicationController
  before_action :set_suspect, only: [:show, :edit, :update, :destroy, :auditoria_sospechosos]
  load_and_authorize_resource
def reporte
  @suspects = Suspect.all
end
  # GET /suspects
  # GET /suspects.json
  def index
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
        format.html { redirect_to @suspect, notice: 'Suspect was successfully created.' }
        format.json { render :show, status: :created, location: @suspect }
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
        format.html { redirect_to @suspect, notice: 'Suspect was successfully updated.' }
        format.json { render :show, status: :ok, location: @suspect }
      else
        format.html { render :edit }
        format.json { render json: @suspect.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suspects/1
  # DELETE /suspects/1.json
  def destroy
    @suspect.destroy
    respond_to do |format|
      format.html { redirect_to suspects_url, notice: 'Suspect was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  # GET /suspects/1/auditoria_sospechosos
  def auditoria_sospechosos
    @nomenu = true
    @audits = @suspect.audits.collect { |aud|
      {
        :user => User.where(id: aud.user_id).count>0 ? User.find(aud.user_id).entity.full_name : "Undefined",
        :date => aud.created_at,
        :changes => Hash[aud.audited_changes.map { |elemento, cambio|
          #se setean las referencias como sus valores correctos
          #si ese un id
          if elemento.include?("_id") && cambio[1]!=0
            if elemento=="entity_id"
              elemento = "entity"
              cambio = [Entity.find(cambio[0]).full_name , Entity.find(cambio[1]).full_name]
            end
          elsif elemento.include?("_id") && cambio[1]==0
            if elemento=="entity_id"
              elemento = "entity"
              cambio = Entity.where(id: cambio[0]).count>0 ? Entity.find(cambio[0]).full_name : nil
            end
          end
          if cambio==nil
            cambio="Sin Definir"
          end
          [elemento, cambio]
        }],
        :action => aud.action
      }
    }
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
