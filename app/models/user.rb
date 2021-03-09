class User < ApplicationRecord
  before_save {email.downcase!}


  validates :username, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true
end
