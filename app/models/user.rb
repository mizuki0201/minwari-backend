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
  # VALID_PASSWORD_REGEX = /\A[a-z0-9]+{6,}\z/i
  VALID_USERID_REGEX = /\A[a-zA-Z0-9]+{4,}\z/

  with_options presence: true do
    validates :name, length: { maximum: 50 }
    validates :user_id, format: { with: VALID_USERID_REGEX }
    # validates :password  # なぜかパスワードにバリデーションをかけるとエラーが出るので、devise token authにデフォルトであるバリデーションを使用
    validates :email, format: { with: VALID_EMAIL_REGEX }
    validates :phone, :user_id, uniqueness: { case_sensitive: true }
  end

  # すでに友達かどうかを判定する
  def already_friend?(login_user_id)
    Friend.exists?(from_id: login_user_id, to_id: self.id) || Friend.exists?(from_id: self.id, to_id: login_user_id)
  end
end
