class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account at Soncoyo.com'
  
    @body[:url]  = "http://soncoyo.com/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'Your account has been activated!'
    @body[:url]  = "http://soncoyo.com/"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "webmaster@soncoyo.com"
      @subject     = "[soncoyo.com] "
      @sent_on     = Time.now
      @body[:user] = user
    end
    
end
