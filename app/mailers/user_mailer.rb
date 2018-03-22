class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/users/sign_in'
    mail(to: @user.email, subject: 'Welcome haha')
  end

  def rejection_email(user)
    @user = user
    mail(to: @user.email,
       subject: 'Your HeppSY request has been rejected'),
       template_path: 'admin/requests',
       template_name: 'reject'
     end
   end


end
