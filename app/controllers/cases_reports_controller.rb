class CasesReportsController < ApplicationController

	def listar_casos
		@casos = LegalCase.all
	end
end
