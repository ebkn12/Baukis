class StaffMemberPresenter < ModelPresenter
  delegate :family_name,
           :given_name,
           :family_name_kana,
           :given_name_kana,
           :suspended,
           to: :object

  def full_name
    "#{family_name} #{given_name}"
  end

  def full_name_kana
    "#{family_name_kana} #{given_name_kana}"
  end

  def suspended_status
    suspended ? '停止中' : ''
  end
end
