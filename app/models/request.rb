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
