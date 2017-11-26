
class LegalCasePdf < Prawn::Document
	def initialize()
		super()
		@casos = LegalCase.order("id DESC").all
		legal_case_all
	end

	def legal_case_all
		table all_legal_case do
			row(0).font_style = :bold
			columns(1..3).align = :right
			self.row_colors = ["DDDDDD", "FFFFFF"]
			self.header = true
		end
	end

	def all_legal_case
		[["Formulario de Entrada", "Nombre", "Usuario", "Juzgados", "Juez", "Imputados", "Ficha Penal", "Comentario", "Sentencia"]] +
		@casos.map do |legal_case|
			[legal_case.entry_form, legal_case.name, legal_case.user.entity.full_name, legal_case.court.name, legal_case.judge.entity.full_name, legal_case.suspect.entity.full_name, legal_case.criminal_record.inquire_number, legal_case.comment, legal_case.final_sentence]
		end
	end
end
