class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to: "s.satou4412@gmail.com", subject: "お問い合わせ確認メール"
  end
end
