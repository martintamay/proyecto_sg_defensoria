class TransferCasePdf < Prawn::Document
    def initialize()
    	super()
    	@transferencia = TransferCase.order("id DESC").all
        transfer_case_all
    end

    def transfer_case_all
    	table all_transfer_cases do
    		row(0).font_style = :bold
    		columns(1..3).align = :right
    		self.row_colors = ["DDDDDD","FFFFFF"]
    		self.header = true
    	end
    end

    def all_transfer_cases
       [["Defensor Anterior", "Defensor Actual", "Caso", "Fecha de Transferencia", "Comentario"]] +
       @transferencia.map do |suspect| 
         [transfer_case.user.entity.full_name, transfer_case.user.entity.full_name, transfer_case.legal_case.name, transfer_case.date_transfer, transfer_case.comentary]
       end
    end
end