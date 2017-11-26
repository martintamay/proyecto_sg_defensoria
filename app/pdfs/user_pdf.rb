class UserPdf < Prawn::Document
    def initialize()
    	super()
    	@usuario = User.order("id DESC").all
        user_all
    end

    def user_all
    	table all_users do
    		row(0).font_style = :bold
    		columns(1..3).align = :right
    		self.row_colors = ["DDDDDD","FFFFFF"]
    		self.header = true
    	end
    end

    def all_users
       [["Email", "Nombre", "Telefono", "Nacimiento", "Email (Entidad)", "Tipo de Usuario"]] +
       @usuario.map do |user| 
         [user.email, user.entity.full_name, user.entity.phone, user.entity.birthdate, user.entity.email, user.type_user]
       end
    end
end