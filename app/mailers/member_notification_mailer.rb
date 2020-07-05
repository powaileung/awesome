class MemberNotificationMailer < ApplicationMailer
  default from: "parkautosales.sb@gmail.com"

  def send_signup_email(member)
    @member = member
    mail( :to => @member.email,
    :subject => 'Thanks for signing up for our amazing app' )
  end
end
