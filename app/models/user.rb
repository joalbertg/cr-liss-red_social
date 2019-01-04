class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
          omniauth_providers: %i[facebook]

  validates :username, presence: true, uniqueness: true, length: { in: 3..12 }
  validate :validate_username_regex
  
  def self.from_omniauth(auth)
  # search if there is a user with these credentials
  # if it does not exist, create a new user with provider and uid
    where(provider: auth.fetch('provider'), uid: auth.fetch('uid')).first_or_create do |user|
      if auth.fetch('info')
        user.email = auth.fetch('info').fetch('email')
        user.name = auth.fetch('info').fetch('name')
      end
      user.password = Devise.friendly_token[0,20]
      # create a string that contains random characters
    end
  end

  private

  def validate_username_regex
    unless username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9_]*\z/
      errors.add(:username, "debe iniciar con una letra y contener sólo letras, números y guión bajo.")
    end
  end
end
