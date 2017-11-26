class TransferCasesReportsController < ApplicationController
	#para el formato pdf
    def index
    	@transferencia = TransferCase.order("id DESC").all

		respond_to do |format|
			format.html
			format.pdf do
				pdf = TransferCasePdf.new()				
				send_data pdf.render, filename: 'Historial_de_Imputados.pdf', type: 'application/pdf', disposition: "inline"
            end       
         end

    end

	def listar_transferencias
		@transferencia = TransferCase.all
	end

end
