# frozen_string_literal: true

class User < ApplicationRecord
  has_many :articles
  has_many :comments
  has_one_attached :avatar
  rolify
  after_create :assign_default_role
  validates :email, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def assign_default_role
    add_role(:profile) if roles.blank?
  end
end
