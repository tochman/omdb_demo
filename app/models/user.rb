# frozen_string_literal: true

class User < ActiveRecord::Base
  after_create :create_watchlist
  extend Devise::Models

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_one :watchlist

  private 
  
  def self.from_omniauth(uid, email, provider)
    where(uid: uid, provider: provider, email: email).first_or_create do |user|
     user.email = email
     user.password = Devise.friendly_token[0,20]
  end
end
  def create_watchlist
    Watchlist.create(user_id: id)
  end
end
