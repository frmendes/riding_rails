class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  EMAIL_REGEX = /\A[\w\-.]+@[a-z\-\d]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :email, :name, :username, presence: true, length: {maximum: 50}
  validates :email, format: EMAIL_REGEX, uniqueness: {case_sensitive: false}
  validates :username, uniqueness: {case_sensitive: false}
end
