class ShiftPdf < Prawn::Document
    def initialize()
    	super()
    	@turno = Shift.order("id DESC").all
        shift_all
    end

    def shift_all
    	table all_shifts do
    		row(0).font_style = :bold
    		columns(1..3).align = :right
    		self.row_colors = ["DDDDDD","FFFFFF"]
    		self.header = true
    	end
    end

    def all_shifts
       [["Fecha de Turno", "Usuario"]] +
       @turno.map do |shift| 
         [shift.shift_date, shift.user.entity.full_name]
       end
    end
end