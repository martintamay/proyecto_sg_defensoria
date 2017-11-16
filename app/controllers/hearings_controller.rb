class HearingsController < ApplicationController
  before_action :set_hearing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /hearings
  # GET /hearings.json
  def index
    @hearings = Hearing.all
    respond_to do |format|
   format.html
   format.pdf do
    pdf = HearingPdf.new(@hearing)
    send_data pdf.render, filename: "hearing_#{@hearing}.pdf",
    type: "application/pdf",
    disposition: "inline"  
     end
      end
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
        format.html { redirect_to @hearing, notice: 'Hearing was successfully created.' }
        format.json { render :show, status: :created, location: @hearing }
      else
        format.html { render :new }
        format.json { render json: @hearing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hearings/1
  # PATCH/PUT /hearings/1.json
  def update
    respond_to do |format|
      if @hearing.update(hearing_params)
        format.html { redirect_to @hearing, notice: 'Hearing was successfully updated.' }
        format.json { render :show, status: :ok, location: @hearing }
      else
        format.html { render :edit }
        format.json { render json: @hearing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hearings/1
  # DELETE /hearings/1.json
  def destroy
    @hearing.destroy
    respond_to do |format|
      format.html { redirect_to hearings_url, notice: 'Hearing was successfully destroyed.' }
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

