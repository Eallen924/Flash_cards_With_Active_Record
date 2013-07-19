class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: => true
  validates :email, presence: true, uniqueness: => true
  validates :password, presence: true,length: { in: 6..20 }

  

  def self.authenticate(email, password)
    user = self.find_by_email(email)
    if user && user.password == password
      user
    else
      nil
    end
  end

  def email_valid?
    if email.present? && email !~ /\A([^@\s]+)@((?:[-a-z0-p]+\.)+[a-z]{2,})\Z/i
      errors.add(:email, "Email is invalid")
    end
  end
end


