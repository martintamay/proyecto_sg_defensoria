class LegalCasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_legal_case, only: [:show, :edit, :update, :destroy, :reporte_completo_caso, :auditoria_caso]
  load_and_authorize_resource

  # GET /legal_cases
  # GET /legal_cases.json

  def reporte
    # @legal_cases = LegalCase.all
    @hearings = Hearing.includes(:legal_case).all
    @transfers = TransferCase.includes(:legal_case).all
  end

  def reporte_completo_caso
    
    @q = params[:q]
  if @q
    @criminal_record = CriminalRecord.where("prosecutor_unit like ?", "%#{@q}%")
  else
     @criminal_record = @legal_case.criminal_record
    @hearings = @legal_case.hearings
    @transfers = @legal_case.transfer_cases
   end
  end

  def index
    @legal_cases = LegalCase.all
    respond_to do |format|
      format.html
      format.pdf do
        pdf = LegalCasePdf.new(@legal_case)
        send_data pdf.render, filename: "LegalCaseReport.pdf",
        type: "application/pdf",
        disposition: "inline"
      end
    end
  end

  # GET /legal_cases/1
  # GET /legal_cases/1.json
  def show
  end

  # GET /legal_cases/new
  def new
    @legal_case = LegalCase.new
  end

  # GET /legal_cases/1/edit
  def edit
  end

  # POST /legal_cases
  # POST /legal_cases.json
  def create
    @legal_case = LegalCase.new(legal_case_params)

    respond_to do |format|
      if @legal_case.save
        UserMailer.notificar(@legal_case.user, "Notificaion de caso", "Se le asignó un caso").deliver()
        format.html { redirect_to legal_cases_url, notice: 'Se ha creado un Caso' }
        format.json { render :show, status: :created, location: @legal_case }    
      else
        format.html { render :new }
        format.json { render json: @legal_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legal_cases/1
  # PATCH/PUT /legal_cases/1.json
  def update
    respond_to do |format|
      if @legal_case.update(legal_case_params)
        format.html { render legal_cases_url, notice: 'Caso Modificado' }
        format.json { render :show, status: :ok, location: @legal_case }
      else
        format.html { render :edit }
        format.json { render json: @legal_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_cases/1
  # DELETE /legal_cases/1.json
 #NO se puede eliminar un caso
  # GET /legal_cases/1/auditoria_caso
  def auditoria_caso
    @nomenu = true
    @audits = @legal_case.audits.collect { |aud|
      {
        :user => User.find(aud.user_id).entity.full_name,
        :changes => Hash[aud.audited_changes.map { |elemento, cambio|
          #se setean las referencias como sus valores correctos
          #si ese un id
          if elemento.include?("_id") && cambio[1]!=0
            if elemento=="user_id"
              elemento = "user"
              cambio = [User.find(cambio[0]).entity.full_name , User.find(cambio[1]).entity.full_name]
            elsif elemento=="suspect_id"
              elemento = "suspect"
              cambio = [Suspect.find(cambio[0]).entity.full_name , Suspect.find(cambio[1]).entity.full_name]
            elsif elemento=="judge_id"
              elemento = "judge"
              cambio = [Judge.find(cambio[0]).entity.full_name , Judge.find(cambio[1]).entity.full_name]
            elsif elemento=="court_id"
              elemento = "court"
              cambio = [Court.find(cambio[0]).name , Court.find(cambio[1]).name]
            elsif elemento=="criminal_record_id"
              elemento = "criminal_record"
              cambio = [CriminalRecord.find(cambio[0]).inquire_number , CriminalRecord.find(cambio[1]).inquire_number]
            end
          elsif elemento.include?("_id") && cambio[1]==0
            if elemento=="user_id"
              elemento = "user"
              cambio = User.find(cambio[0]).entity.full_name
            elsif elemento=="suspect_id"
              elemento = "suspect"
              cambio = Suspect.find(cambio[0]).entity.full_name
            elsif elemento=="judge_id"
              elemento = "judge"
              cambio = Judge.find(cambio[0]).entity.full_name
            elsif elemento=="court_id"
              elemento = "court"
              cambio = Court.find(cambio[0]).name
            elsif elemento=="criminal_record_id"
              elemento = "criminal_record"
              cambio = CriminalRecord.find(cambio[0]).inquire_number
            end
          end
          [elemento, cambio]
        }],
        :action => aud.action
      }
    }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal_case
      @legal_case = LegalCase.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_case_params
      params.require(:legal_case).permit(:entry_form, :name, :user_id, :court_id, :judge_id, :suspect_id, :criminal_record_id, :comment, :final_sentence)
    end
end
