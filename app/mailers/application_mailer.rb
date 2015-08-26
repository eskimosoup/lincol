class ApplicationMailer < ActionMailer::Base

  def site_email
    @site_email = begin
      site_setting = Optimadmin::SiteSetting.find_by(key: "Email")
      if site_setting
        site_setting.value
      else
        "support@optimised.today"
      end
    end
  end

  default from: site_email
  layout "mailer"

  def application_created(application)
    @application = application
    attachments[File.basename(@application.cv.path)] = File.read(@application.cv.path)
    mail to: site_email, subject: "Application form completed #{ site_name }"
  end

  def site_name
    @site_name = begin
      site_setting = Optimadmin::SiteSetting.find_by(key: "Name")
      if site_setting
        site_setting.value
      else
        "Optimised"
      end
    end
  end
end
