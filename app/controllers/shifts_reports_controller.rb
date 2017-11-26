class ShiftsReportsController < ApplicationController

	#para el formato pdf
    def index
    	@turno = Shift.order("id DESC").all
		
    end

	def listar_turnos
		@turno = Shift.all
	end

end
