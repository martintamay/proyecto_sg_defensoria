class LegalCasesController < ApplicationController
  before_action :set_legal_case, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :obtenerListado
  load_and_authorize_resource
def index
    redirect_to :action => "new"     
  end
  def obtenerListado
    @legal_cases = LegalCase.all
     respond_to do |format|
   format.html
   format.pdf do
    pdf = LegalCasePdf.new(@legal_case)
    send_data pdf.render, filename: "nada.pdf",
    type: "application/pdf",
    disposition: "inline"  
     end
      end
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
        format.html { render :new, notice: '' }
        format.json { render :new, status: :created, location: @legal_case }
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
        format.html { render :new, notice: '' }
        format.json { render :new, status: :ok, location: @legal_case }
      else
        format.html { render :edit }
        format.json { render json: @legal_case.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legal_cases/1
  # DELETE /legal_cases/1.json
  def destroy
    @legal_case.destroy
    respond_to do |format|
      format.html { render :new, notice: '' }
      format.json { head :no_content }
    end
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
