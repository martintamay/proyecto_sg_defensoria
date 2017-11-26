class VisitPdf < Prawn::Document
	def initialize()
		super()
		@visita = Visit.order("id DESC").all
		visit_all
	end

	def visit_all
		table all_visits do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD", "FFFFFF"]
			self.header = true
		end
	end

	def all_visits
		[["Imputado", "Visitante", "Dia Visitado", "Observacion"]] +
		@visita.map do |visit|
			[visit.suspect.entity.full_name, visit.name_visit, visit.date_visit, visit.observation]
		end
	end
end