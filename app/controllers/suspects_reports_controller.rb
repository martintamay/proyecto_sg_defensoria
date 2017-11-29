class SuspectsReportsController < ApplicationController

    
#para el formato pdf
    def index
    	@suspect = Suspect.order("id DESC").all
		respond_to do |format|
			format.html
			format.pdf do
				pdf = SuspectPdf.new()				
				send_data pdf.render, filename: 'Historial_de_Imputados.pdf', type: 'application/pdf', disposition: "inline"
            end       
         end
    end

	def listar_imputados
		@suspect = Suspect.all

	end

	
  
end
