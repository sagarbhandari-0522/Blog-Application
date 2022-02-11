class User < ApplicationRecord
  has_many :articles
  has_many :comments
  rolify
  after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable

  def assign_default_role
    add_role(:profile) if roles.blank?
  end
end
