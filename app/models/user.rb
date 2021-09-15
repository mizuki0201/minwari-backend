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
  has_many :friends

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_PASSWORD_REGEX = /\A[a-z0-9]+{4,}\z/i

  with_options presence: true do
    validates :name, :user_id
    # validates :password  # なぜかパスワードにバリデーションをかけるとエラーが出る
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :phone, uniqueness: { case_sensitive: true }
  end
end
