class AppointmentMailer < ApplicationMailer
    def appointment_mailer(user)
        @appointment = user
        mail to: user.email, subject: "Votre demande de rendez-vous reçue avec succès"
    end
end
