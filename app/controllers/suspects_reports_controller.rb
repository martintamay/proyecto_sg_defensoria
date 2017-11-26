class SuspectsReportsController < ApplicationController

    
#para el formato pdf
    def index
    	@sospechoso = Suspect.order("id DESC").all
		
    end

	def listar_imputados
		@sospechoso = Suspect.all

	end

	
  
end
