# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models  # エラー解決のために記載
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  has_many :group_users
  has_many :groups, through: :group_users
  has_many :expences
end
