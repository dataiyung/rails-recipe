class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_one :profile
  accepts_nested_attributes_for :profile
  has_many :memberships
  has_many :groups, :through => :memberships
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :registrations
  def display_name
    self.email.split("@").first
  end

end
