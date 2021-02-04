# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :username, :session_token, :password_digest, presence: true
  validates :username, :session_token,                   uniqueness: true
  validates :password, length: { minimum: 6, 
                                 allow_null: true }

  before_action  

  def  
  end
end
