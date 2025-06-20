class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :registerable

  has_many :projects

  attr_accessor :raw_password

  before_validation :set_default_salt, if: :new_record?

  before_save :hash_password_if_needed

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

  private

  def set_default_salt
    self.salt ||= SecureRandom.hex(4)
  end

  def hash_password_if_needed
    if raw_password.present? && salt.present?
      self.encrypted_password = Digest::MD5.hexdigest(Digest::MD5.hexdigest(raw_password) + salt)
    end
  end
end
