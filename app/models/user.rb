# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  username               :string           default(""), not null
#  name                   :string
#  last_name              :string
#  bio                    :text
#  uid                    :string
#  provider               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  avatar_file_name       :string
#  avatar_content_type    :string
#  avatar_file_size       :bigint(8)
#  avatar_updated_at      :datetime
#  cover_file_name        :string
#  cover_content_type     :string
#  cover_file_size        :bigint(8)
#  cover_updated_at       :datetime
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable,
          omniauth_providers: %i[facebook]

  validates :username, presence: true, uniqueness: true, length: { in: 3..12 }
  validate :validate_username_regex
  has_many :posts

  has_attached_file :avatar, 
                    styles: { medium: "300x300>", thumb: "100x100>" }, 
                    default_url: "/images/:style/missing_avatar.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/(jpeg|jpg)\z/i

  has_attached_file :cover, 
                    styles: { medium: "800x600>", thumb: "400x300>" }, 
                    default_url: "/images/:style/missing_cover.jpg"
  validates_attachment_content_type :cover, content_type: %i["image/jpeg" "image/gif" "image/png"]

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
    return if username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9_]*\z/
    errors.add(:username, "debe iniciar con una letra y contener sólo letras, números y guión bajo.")
  end
end
