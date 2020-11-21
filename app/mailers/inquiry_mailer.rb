class InquiryMailer < ApplicationMailer
  # def send_mail(inquiry)
  #   @inquiry = inquiry
  #   mail(
  #     from: 'system@example.com',
  #     to:   ENV['GOOGLE_MAIL'],
  #     subject: 'お問い合わせ通知'
  #   )
  # end

  default from: ENV['GOOGLE_MAIL']   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    # mail(:to => inquiry.email, :subject => 'お問い合わせを承りました')
    mail(:to => ENV['GOOGLE_MAIL'], :subject => 'お問い合わせがあります')
  end
end
