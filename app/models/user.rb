class User < ActiveRecord::Base
  validates :username, presence: true
  validates :username, uniqueness: true
  validate :password

  has_many :votes
  has_many :questions
  has_many :answers
  has_many :responses

  include BCrypt

  def password
    if password_hash
      @password ||= Password.new(password_hash)
    else
      errors.add(:password, "can't be left blank")
    end
  end


  def password=(new_password)
    if !new_password.empty?
      @password = Password.create(new_password)
      self.password_hash = @password
    end
  end

  def self.authenticate(user_info)
    username = user_info[:username]
    password = user_info[:password]
    user = User.find_by(username: username)
    return user if user && user.password == password
  end

end
