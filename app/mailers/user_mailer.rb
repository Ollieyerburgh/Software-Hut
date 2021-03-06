class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to HeppSY')
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

  def weekly_email(preference, activities, user)
    @preference = preference
    @activities = activities
    @user = user
    mail(to: @user.email, subject: 'Your weekly HeppSY email')
  end

  def cancellation_email(user, activity)
    @user = user
    @activity = activity
    mail(to: @user.email, subject: "An event you're interested in has been cancelled")
  end




end
