class Staff::Base < ApplicationController
  before_action :check_source_ip_address,
                :authenticate_user,
                :check_account,
                :check_timeout

  TIMEOUT = 60.minutes.freeze

  private

  def check_source_ip_address
    raise IpAddressRejected unless AllowedSource.include?('staff', request.ip)
  end

  def current_staff_member
    return unless session[:staff_member_id]

    @current_staff_member ||= StaffMember.find_by(id: session[:staff_member_id])
  end

  helper_method :current_staff_member

  def authenticate_user
    return if current_staff_member
    redirect_to staff_login_path, alert: 'ログインしてください'
  end

  def check_account
    return if current_staff_member.blank? || current_staff_member.active?

    session.delete(:staff_member_id)
    redirect_to staff_root_path, alert: 'アカウントが無効です'
  end

  def check_timeout
    return unless current_staff_member

    if session[:last_access_time] && session[:last_access_time] >= TIMEOUT.ago
      session[:last_access_time] = Time.current
    else
      session.delete(:staff_member_id)
      redirect_to staff_login_path, alert: 'セッションがタイムアウトしました'
    end
  end
end
