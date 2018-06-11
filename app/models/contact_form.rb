class ContactForm < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i

  attribute :message
  attribute :tel, captcha: true

  def headers
    {
      subject: 'Contact Form',
      to: ENV['CSC_CONTACT_EMAIL'],
      from: %("#{name}" <#{email}>)
    }
  end
end
