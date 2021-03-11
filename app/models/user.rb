class User < ApplicationRecord
  before_save {email.downcase!}


  validates :username, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false},
            format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i}

  validates :password, presence: true
end
