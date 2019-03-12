# frozen_string_literal: true

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
  has_many :posts
  # friendships that I have added in which the user_id is me
  has_many :friendships # friendships in which I added the person
  # Friends that I have added (request friend request)
  # friends that I added
  has_many :friends_added, through: :friendships, source: :friend
  # all the people who have added me, in which I am the friend_id
  has_many :followers, class_name: 'Friendship', foreign_key: 'friend_id'
  # the friends who added me
  has_many :friends_who_added, through: :followers, source: :user

  validates :username, presence: true, uniqueness: true, length: { in: 3..12 }
  validate :validate_username_regex

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :omniauthable, omniauth_providers: %i[facebook]

  has_attached_file :avatar,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/missing_avatar.png'
  validates_attachment_content_type  \
    :avatar,
    content_type: %r{ /\Aimage\/(jpeg|jpg)\z/i }

  has_attached_file :cover,
                    styles: { medium: '800x600>', thumb: '400x300>' },
                    default_url: '/images/:style/missing_cover.jpg'
  validates_attachment_content_type \
    :cover,
    content_type: %i["image/jpeg" "image/gif" "image/png"]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  def friend_ids
    # i'm the user => friend_id
    Friendship.active.where(user: self).pluck(:friend_id)
    # SELECT  friend_id FROM friendships WHERE user_id = self
  end

  def user_ids
    # i'm the friend => user_id
    Friendship.active.where(friend: self).pluck(:user_id)
  end

  def self.from_omniauth(auth)
    # search if there is a user with these credentials
    # if it does not exist, create a new user with provider and uid
    where(provider: auth.fetch('provider'),
          uid: auth.fetch('uid')).first_or_create do |user|
      if auth.fetch('info')
        user.email = auth.fetch('info').fetch('email')
        user.name = auth.fetch('info').fetch('name')
      end
      user.password = Devise.friendly_token[0, 20]
      # create a string that contains random characters
    end
  end

  def my_friend?(friend)
    Friendship.friends?(self, friend)
  end

  private

  def validate_username_regex
    return if username =~ /\A[a-zA-Z]*[a-zA-Z][a-zA-Z0-9_]*\z/

    errors.add(:username,
               'debe iniciar con una letra y contener sólo letras,
               números y guión bajo.')
  end
end
