class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password_hash, presence: true
    
  has_many :rounds
  
  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(username, password)
    user = self.find_by_username(username)
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


