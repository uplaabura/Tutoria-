class User < ActiveRecord::Base

  EMAIL_REGEX = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[A-Z]{2,4}$/i
  attr_accessible :name, :email, :password, :password_confirmation
  has_secure_password

  validates :name,  presence: true,
                    uniqueness: true,
                    length: {in: 3..20}
  validates :email, presence: true,
                    uniqueness: {case_sensitive: false},
                    format: EMAIL_REGEX
  validates :password,  presence: true,
                        length: {in: 4..20}
  validates :password_confirmation, presence: true

  before_save {|user| user.email = email.downcase}

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

