class UserMailer < ApplicationMailer
	default from: "sistemdef1@gmail.com"

	def welcome(correo, mensaje)
	   Rails.logger.info "==========sending welcome email to ==> #{correo}"
	   @mensaje = mensaje
	   mail(:to => correo, :subject => "Eureka")
	end

	def notificar(user, titulo, notificacion)
		correo = user.email;
		Rails.logger.info "==========sending welcome email to ==> #{correo} .-. #{notificacion}"
		@mensaje = notificacion
		mail(:to => correo, :subject => titulo)
	end
end

