class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :cambiar_rol]
  #before_action :authenticate_user!
  #load_and_authorize_resource


  def cambiar_rol
    if params[:type_rol]
      type_rol = params[:type_rol]
      if type_rol == "acceso"
        if @user.has_role? :admin
          @user.revoke :admin
          @user.add_role :default
        else
          @user.revoke :default
          @user.add_role :admin
        end
      elsif type_rol == "tipo"
          if @user.has_role? :lawyer
            @user.revoke :lawyer
            @user.add_role :assistant
          else
            @user.revoke :assistant
            @user.add_role :lawyer
          end
      else
        respond_to do |format|
          format.html { render :edit, alert: "Tipo de rol equivocado para cambiar" }
        end
      end
      respond_to do |format|
        format.html { render :edit, notice: 'Se cambió el rol del usuario.' }
      end
    end
  end

  # GET /users
  # GET /users.json
  def index
    if params[:tipo_rol]
      if params[:tipo_rol] == "lawyer"
        @users = User.with_role(:lawyer)
        @titulo = "Defensores"
      elsif params[:tipo_rol] == "assistant"
        @users = User.with_role(:assistant)
        @titulo = "Asistentes"
      end
    else
      @users = User.all
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.entity = Entity.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.email = @user.entity.email

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_user }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
      	@user.email = @user.entity.email
      	@user.save
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_user }
      end
    end
  end

  def auditoria_usuario

  end


  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    if @user.email != "admin@defensoria.com"
      @user.destroy
      respond_to do |format|
        format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  private
    # obtain audited changes from an object
    def obtenerAuditoria(user)
      user.audits.collect { |aud|
        {"user" => aud.user_id,
        "changes" => aud.audited_changes,
        "action" => aud.action}
      }
    end


    # Use callbacks to share common setup or constraints between actions.
    def set_user
      if params[:id] == 'sign_out'
        sign_out
        redirect_to "/"
      else
        @user = User.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:password, :password_confirmation, :type_user, entity_attributes: [:name, :last_name, :phone, :birthdate, :email])
    end
end
