class SuspectsReportsController < ApplicationController

    
#para el formato pdf
    def index
    	@sospechoso = Suspect.order("id DESC").all
		respond_to do |format|
			format.html
			format.pdf do
				pdf = SuspectPdf.new()				
				send_data pdf.render, filename: 'Historial_de_Imputados.pdf', type: 'application/pdf', disposition: "inline"
            end       
         end


    end

	def listar_imputados
		@sospechoso = Suspect.all
	
	end

	
  
end
