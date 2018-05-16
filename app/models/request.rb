#This model is used to send the rejectioon email to the user when the admin is not happy with something in the activity submitted by the user
class Request < MailForm::Base
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname,  :captcha  => true

  def headers
      {
        :subject => "Rejected request",
        :to => %<#{email}>,
        :from => %("HeppSY" )
      }
    end
  end
