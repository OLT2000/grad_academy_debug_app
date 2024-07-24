# app/helpers/users_helper.rb
module UsersHelper
    def experience_bar(user)
      percent = (user.experience.to_f / user.required_experience * 100).round
      content_tag :div, class: 'progress' do
        content_tag :div, "#{percent}%", class: 'progress-bar', style: "width: #{percent}%;"
      end
    end
  end