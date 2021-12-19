class ContactMailer < ApplicationMailer
  def contact_mail(contact, commit)
    @contact = contact
    @picture = contact
    
    if commit == '登録する'
      mail to: @contact.email, subject: 'お問い合わせの確認メール'
      v
    #   mail(to: @contact.email,
    #        subject: '投稿確認メール',
    #        template_path: 'contact_mailer',
    #        template_name: 'contact_mail'
    #     )
    #   mail(to: @contact.email,
    #        subject: '投稿確認メール',
    #     ) do |format|
    #   format.html { render 'contact_mail' }
    #     end
           
    elsif commit == '投稿する'
    #   mail to: @picture.user.email, subject: '投稿確認メール'
      mail(to: @picture.user.email,
           subject: '投稿確認メール',
           template_path: 'contact_mailer',
           template_name: 'picture_mail'
        )
    else
    end
  end
end
