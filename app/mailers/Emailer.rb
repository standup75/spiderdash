class Emailer < ActionMailer::Base
  def pwd_forgotten(email, new_pass)
    @new_pass=new_pass
    @email=email
    mail(:to => email, :subject => "Your new password")
  end
end
