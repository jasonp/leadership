class LinkMailer < ApplicationMailer
  default from: 'jason@jrpreston.com'
  
  def send_secret_link(worksheet, twc)
    
    @to_email = worksheet.email
    @link = worksheet_url(worksheet, twc: twc)
    from_email_with_name = %("Jason Preston (Leadership)" <jason@jrpreston.com>)
    mail(to: @to_email, from: from_email_with_name, subject: 'Your adaptive leadership secret link')
    
  end
  
end