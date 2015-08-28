class ContactMailer < ActionMailer::Base

  def new(global_site_settings, contact)
    @site_settings = global_site_settings
    @contact = contact
    mail to: @site_settings['Email'], from: @site_settings['Email'], subject: "#{@contact.form.present? ? @contact.form : 'Contact' } form completed - #{@site_settings['Name']}"
  end

end
