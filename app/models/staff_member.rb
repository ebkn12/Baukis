class StaffMember < ApplicationRecord
  has_many :events, class_name: 'StaffEvent', dependent: :destroy

  before_validation do
    self.email_for_index = email.downcase if email
  end

  def password=(raw_password)
    if raw_password.is_a?(String)
      self.hashed_password = BCrypt::Password.create(raw_password)
    elsif raw_password.nil?
      self.hashed_password = nil
    end
  end

  def active?
    !suspended &&
      start_date <= Time.zone.today &&
      (end_date.nil? || end_date > Time.zone.today)
  end

  def full_name
    "#{family_name} #{given_name}"
  end

  def full_name_kana
    "#{family_name_kana} #{given_name_kana}"
  end
end
