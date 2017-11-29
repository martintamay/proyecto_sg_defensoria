class EquipmentDetailsController < ApplicationController
  before_action :set_equipment_detail, only: [:show, :edit, :update, :destroy]
  
  load_and_authorize_resource

  # GET /equipment_details
  # GET /equipment_details.json
  def index
    @equipment_details = EquipmentDetail.all
    @judges = Judge.all
  end

  # GET /equipment_details/1
  # GET /equipment_details/1.json
  def show
  end

  # GET /equipment_details/new
  def new
    @equipment_detail = EquipmentDetail.new
  end

  # GET /equipment_details/1/edit
  def edit
  end

  # POST /equipment_details
  # POST /equipment_details.json
  def create
    @equipment_detail = EquipmentDetail.new(equipment_detail_params)

    respond_to do |format|
      if @equipment_detail.save
        format.html { redirect_to @equipment_detail, notice: 'Equipment detail was successfully created.' }
        format.json { render :show, status: :created, location: @equipment_detail }
      else
        format.html { render :new }
        format.json { render json: @equipment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment_details/1
  # PATCH/PUT /equipment_details/1.json
  def update
    respond_to do |format|
      if @equipment_detail.update(equipment_detail_params)
        format.html { redirect_to @equipment_detail, notice: 'Equipment detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment_detail }
      else
        format.html { render :edit }
        format.json { render json: @equipment_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment_details/1
  # DELETE /equipment_details/1.json
  def destroy
    @equipment_detail.destroy
    respond_to do |format|
      format.html { redirect_to equipment_details_url, notice: 'Equipment detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment_detail
      @equipment_detail = EquipmentDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_detail_params
      params.require(:equipment_detail).permit(:legal_case_id, :user_id)
    end
end
