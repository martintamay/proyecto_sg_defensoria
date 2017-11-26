class UsersReportsController < ApplicationController
	#para el formato pdf
    def index
    	@usuario = User.order("id DESC").all
		
    end

	def listar_defensores
		@usuario = User.all
	end

end
