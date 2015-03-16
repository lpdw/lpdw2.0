class Emailer < ActionMailer::Base
   default from: "no-reply@lpdw.u-cergy.fr"

   def contact(data, sent_at = Time.now)
      @name = data["name_contact"]
      @recipient = data["email_contact"]
      @message = data["message_contact"]
      mail(to: @recipient, subject: 'Contacte')
   end
end