class ShiftsReportsController < ApplicationController

	#para el formato pdf
    def index
    	@turno = Shift.order("id DESC").all

		respond_to do |format|
			format.html
			format.pdf do
				pdf = ShiftPdf.new()				
				send_data pdf.render, filename: 'Reporte_de_Turnos.pdf', type: 'application/pdf', disposition: "inline"
            end       
         end

    end

	def listar_turnos
		@turno = Shift.all
	end

end
