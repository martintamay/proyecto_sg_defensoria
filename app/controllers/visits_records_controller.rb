class VisitsRecordsController < ApplicationController

	#para el formato pdf
	def index
		@visita = Visit.order("id DESC").all  
		respond_to do |format|
			format.html
			format.pdf do
				pdf = VisitPdf.new()
				send_data pdf.render, filename: 'Reporte_de_Visitas.pdf', type: 'application/pdf', disposition: "inline"
			end
		end
	end

	def listar_visitas
		@visita = Visit.all  
	end
end
