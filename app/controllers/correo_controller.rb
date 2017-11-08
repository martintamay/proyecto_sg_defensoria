class CorreoController < ApplicationController
	def index
		#UserMailer.welcome().deliver
	end

	def create
		UserMailer.welcome(correo_params[:email], correo_params[:message]).deliver		
	end

	private
	    # Never trust parameters from the scary internet, only allow the white list through.
	    def correo_params
	      params.require(:correo).permit(:email, :message)
	    end
end
