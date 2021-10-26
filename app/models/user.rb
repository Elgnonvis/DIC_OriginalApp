class User < ApplicationRecord
  
  has_many :properties, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :comments, dependent: :destroy
  attr_accessor :login
  validates :username, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  validates :username, presence: false, uniqueness: {case_sensitive: false}, format: { with: /\A[a-zA-Z0-9 _\.]*\z/ }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
       where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
       where(conditions).first
    end
  end
end
