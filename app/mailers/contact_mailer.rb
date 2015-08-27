class ContactMailer < ActionMailer::Base

  def new(contact)
    @contact = contact
    mail to: site_email, from: site_email, subject: "Contact form completed - #{site_name}"
  end

end
