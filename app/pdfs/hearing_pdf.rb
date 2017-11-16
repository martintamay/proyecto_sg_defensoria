class HearingPdf <Prawn::Document
	def initialize(hearings)
		super(top_margin: 70)
		@hearings = Hearing.all
		titulo
		line_items
	end
	def line_items
		move_down 20
		table line_item_rows do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["02BEC4","FFFFFF"]
			self.header = true
		end
	   end
		def titulo
		text "#Reporte De Audiencias", size: 30, style: :bold
	end
	   
	def line_item_rows
		[["Fecha De Audiencia","Usuario","Caso"]] +
		@hearings.map do |item|
			[item.hearing_date, item.user.entity.full_name, item.legal_case.name]
        end	

    end
    
	 
end   