class LegalCasePdf <Prawn::Document
	def initialize(legal_cases)
		super(top_margin:10)
		@legal_cases = LegalCase.all
		titulo
		line_items
	end
	def line_items
		
		table line_item_rows do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["02BEC4","FFFFFF"]
	
		end
	   end
		def titulo
		text "#Reporte De Casos", size: 50, style: :bold
	end
	   
	def line_item_rows
		[["Caso","Imputado","defensor","Juzgado","Juez","Ficha Penal","Sentencia"]] +
		@legal_cases.map do |legal_case|
			[legal_case.name,legal_case.suspect.entity.full_name,legal_case.user.entity.full_name,legal_case.court.name,legal_case.judge.entity.full_name,legal_case.criminal_record.inquire_number,legal_case.final_sentence ]
        end	

    end
end   