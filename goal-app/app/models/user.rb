# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  session_token   :string
#  password_digest :string
#
class User < ApplicationRecord
    before_validation :ensure_session_token
    validates :username, presence: true, uniqueness: true
    validates :password, presence: true 
    
    def ensure_session_token
        self.session_token ||= generate_session_token
    end

    def generate_session_token
        SecureRandom::urlsafe_base64
    end



end
