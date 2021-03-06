module FeaturesSpecHelper
  def switch_namespace(namespace)
    config = Rails.application.config.baukis
    Capybara.app_host = "http://#{config[namespace][:host]}"
  end

  def login_as_staff_member(staff_member, password = 'password')
    visit staff_login_path
    within('form') do
      fill_in 'Email', with: staff_member.email
      fill_in 'Password', with: password
      click_button 'ログイン'
    end
  end
end
