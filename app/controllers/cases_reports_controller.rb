class CasesReportsController < ApplicationController



 #para el formato pdf
    def index
    	@casos = LegalCase.order("id DESC").all
    	respond_to do |format|
    		format.html
    		format.pdf do
    			pdf = LegalCasePdf.new()
    			send_data pdf.render, filename: 'Historial_de_Casos.pdf', type: 'Application/pdf', disposition: "inline"
    		end
    	end
    end


	def listar_casos
		@casos = LegalCase.all
	end
end
