class SuspectPdf < Prawn::Document
    def initialize()
    	super()
    	@sospechoso = Suspect.order("id DESC").all
        suspect_all
    end

    def suspect_all
    	table all_suspects do
    		row(0).font_style = :bold
    		columns(1..3).align = :right
    		self.row_colors = ["DDDDDD","FFFFFF"]
    		self.header = true
    	end
    end

    def all_suspects
       [["Nombre", "Fecha de Nacimiento", "Correo", "Telefono", "C.I.", "Nacionalidad"]] +
       @sospechoso.map do |suspect| 
         [suspect.entity.full_name,suspect.entity.birthdate,suspect.entity.email,suspect.entity.phone,suspect.ci,suspect.nationality]
       end
    end
end