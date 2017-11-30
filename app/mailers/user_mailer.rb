class UserMailer < ApplicationMailer
	default from: "sistemdef1@gmail.com"

	def welcome(correo, mensaje)
	   Rails.logger.info "==========sending welcome email to ==> #{correo}"
	   @mensaje = mensaje
	   mail(:to => correo, :subject => "Eureka")
	end
	def notificar(titulo, razon, caso)
		correo = caso.user.email
		Rails.logger.info "==========sending welcome email to ==> #{correo} .-. #{razon}"
		@razon = razon
		@legal_case = caso 
		mail(:to => correo, :subject => titulo)
	end
 end

