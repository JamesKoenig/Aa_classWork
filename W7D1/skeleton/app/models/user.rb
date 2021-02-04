# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :user_name, presence: true, uniqueness: true
    validates :password_digest, presence: true
    validates :session_token, presence: true, uniqueness: true
    validates :password, length: {minimum: 6}, allow_nil: true
    
    after_initialize :ensure_session_token
    
    #in order to validate the password, we need to read the password
    attr_reader :password

    def self.find_by_credentials(username, pw)
        user = User.find_by(user_name: username)
    
        if user && user.is_password?(pw)
            user 
        else 
            nil
        end
    end
    
    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token
    end

    def ensure_session_token
        self.session_token ||= SecureRandom::urlsafe_base64
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end
    
    def is_password?(pw) 
        BCrypt::Password.new(self.password_digest).is_password?(pw)
    end
    
end
