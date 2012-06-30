class User < ActiveRecord::Base
  attr_accessible :name, :email, :password, :password_confirmation
  
  has_secure_password #this is a ActiveModel helper for storing "password_digest"
  
  #constants and definitions
  EMAIL_REGEX = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[A-Z]{2,4}$/i
  
  #validations
  validates :name,  :presence => true,
                    :uniqueness => true,
                    :length => { :in => 3..20 }
  validates :email, :presence => true,
                    :uniqueness => { :case_sensitive => false },
                    :format => EMAIL_REGEX
  validates :password,  :presence => true,
                        :length => {in: 4..20}
  validates :password_confirmation, :presence => true

  #callback functions
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  #private functions
  private
    def create_remember_token
      # I think it's equal to User.remember_token?
      self.remember_token = SecureRandom.urlsafe_base64 
    end
end
# == Schema Information
#
# Table name: users
#
#  id              :integer         not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#

