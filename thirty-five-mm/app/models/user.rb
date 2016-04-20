class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # has_secure_password
  has_many :reviews
  has_many :ratings
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable,
         :omniauth_providers => [:facebook]

 # validates :password, presence: true
 # validates :email, :username, presence: true, uniqueness: true

  def review_count
    self.reviews.count
  end

  def comment_count
    self.comments.count
  end

  def self.from_omniauth(auth)
    p where(provider: auth.provider,  uid: auth.uid)

    where(provider: auth.provider,  uid: auth.uid).first_or_create do | user |
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
