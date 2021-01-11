# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  session_token   :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token, uniqueness: true
  validate :password, length: { minimum: 2 }, allow_nil: true

  before_validation :ensure_session_token

  attr_reader :password
  
  has_many :posts,
    foreign_key: :user_id,
    class_name: :Post

  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password    
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    return user if user && user.is_password?(password)
    nil
  end


end
