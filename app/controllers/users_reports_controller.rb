class UsersReportsController < ApplicationController
	#para el formato pdf
    def index
    	@usuario = User.order("id DESC").all

		respond_to do |format|
			format.html
			format.pdf do
				pdf = UserPdf.new()				
				send_data pdf.render, filename: 'Reporte_de_Usuario.pdf', type: 'application/pdf', disposition: "inline"
            end       
         end

    end

	def listar_defensores
		@usuario = User.all
	end

end
