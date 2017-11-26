class ReclusionsController < ApplicationController
  before_action :set_reclusion, only: [:show, :edit, :update, :destroy]
  load_and_authorize_resource

  # GET /reclusions
  # GET /reclusions.json
  def index
    @reclusions = Reclusion.all
  end

  # GET /reclusions/1
  # GET /reclusions/1.json
  def show
  end

  # GET /reclusions/new
  def new
    @reclusion = Reclusion.new
  end

  # GET /reclusions/1/edit
  def edit
  end

  # POST /reclusions
  # POST /reclusions.json
  def create
    @reclusion = Reclusion.new(reclusion_params)

    respond_to do |format|
      if @reclusion.save
        format.html { redirect_to @reclusion, notice: 'Reclusion was successfully created.' }
        format.json { render :show, status: :created, location: @reclusion }
      else
        format.html { render :new }
        format.json { render json: @reclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reclusions/1
  # PATCH/PUT /reclusions/1.json
  def update
    respond_to do |format|
      if @reclusion.update(reclusion_params)
        format.html { redirect_to @reclusion, notice: 'Reclusion was successfully updated.' }
        format.json { render :show, status: :ok, location: @reclusion }
      else
        format.html { render :edit }
        format.json { render json: @reclusion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reclusions/1
  # DELETE /reclusions/1.json
  def destroy
    @reclusion.destroy
    respond_to do |format|
      format.html { redirect_to reclusions_url, notice: 'Reclusion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reclusion
      @reclusion = Reclusion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reclusion_params
      params.require(:reclusion).permit(:suspect_id, :place, :date_entry, :date_out)
    end
end
