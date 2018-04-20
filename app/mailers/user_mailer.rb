class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome haha')
  end



  def acception_email(email)
    @email = email
    mail(to: email, subject: 'Your HeppSY request has been accepted')
  end

  def rejection_email(email, message, activity)
    @email = email
    @message = message
    @activity = activity
    mail(to: email, subject: 'Your HeppSY request has been rejected', message: @message)
  end


end
