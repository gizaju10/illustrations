class InquiryMailer < ApplicationMailer
  default from: ENV['GOOGLE_MAIL']   # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(to: ENV['GOOGLE_MAIL'], subject: 'お問い合わせがあります')
  end
end
