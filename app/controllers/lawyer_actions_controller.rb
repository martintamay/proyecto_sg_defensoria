class LawyerActionsController < ApplicationController
  before_action :set_lawyer_action, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :obtenerListado
  load_and_authorize_resource

  def index
    redirect_to :action => "new"     
  end
  def obtenerListado
    @lawyer_actions = LawyerAction.all
  end

  # GET /lawyer_actions/1
  # GET /lawyer_actions/1.json
  def show
  end

  # GET /lawyer_actions/new
  def new
    @lawyer_action = LawyerAction.new
  end

  # GET /lawyer_actions/1/edit
  def edit
  end

  # POST /lawyer_actions
  # POST /lawyer_actions.json
  def create
    @lawyer_action = LawyerAction.new(lawyer_action_params)

    respond_to do |format|
      if @lawyer_action.save
        format.html { render :new, notice: '' }
        format.json { render :new, status: :created, location: @lawyer_action }
      else
        format.html { render :new }
        format.json { render json: @lawyer_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lawyer_actions/1
  # PATCH/PUT /lawyer_actions/1.json
  def update
    respond_to do |format|
      if @lawyer_action.update(lawyer_action_params)
        format.html { render :new, notice: '' }
        format.json { render :new, status: :ok, location: @lawyer_action }
      else
        format.html { render :new }
        format.json { render json: @lawyer_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lawyer_actions/1
  # DELETE /lawyer_actions/1.json
  def destroy
    @lawyer_action.destroy
    respond_to do |format|
      format.html { render :new, notice: '' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lawyer_action
      @lawyer_action = LawyerAction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lawyer_action_params
      params.require(:lawyer_action).permit(:action_date, :legal_case_id, :comment)
    end
end
