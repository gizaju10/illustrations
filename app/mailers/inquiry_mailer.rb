class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to:   ENV['GOOGLE_MAIL'],
      subject: 'お問い合わせ通知'
    )
  end
end
