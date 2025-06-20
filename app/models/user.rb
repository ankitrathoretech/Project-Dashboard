class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :registerable

  has_many :projects

  def self.find_for_database_authentication(warden_conditions)
    where(username: warden_conditions[:username]).first
  end

  def valid_password?(password)
    return false if salt.blank?
    hashed = Digest::MD5.hexdigest(Digest::MD5.hexdigest(password) + salt)
    Devise.secure_compare(hashed, self.encrypted_password)
  end

  def password=(new_password)
    return if new_password.blank? || salt.blank?
    self.encrypted_password = Digest::MD5.hexdigest(Digest::MD5.hexdigest(new_password) + salt)
  end
end
