class TransferCasesReportsController < ApplicationController
	#para el formato pdf
    def index
    	@transferencia = TransferCase.order("id DESC").all
		
    end

	def listar_transferencias
		@transferencia = TransferCase.all
	end

end
