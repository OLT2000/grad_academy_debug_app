# app/helpers/users_helper.rb
module UsersHelper
    def experience_bar(user)
      percent = (user.experience.to_f / user.required_experience(user.level) * 100).round

      # Determine CSS class based on the percentage
      class_name = case percent
        when 0..2 then 'progress-bar-dark-red'
        when 21..40 then 'progress-bar-red'
        when 41..60 then 'progress-bar-orange'
        when 61..80 then 'progress-bar-yellow'
        else 'progress-bar-green'
        end

      content_tag :div, class: 'progress' do
        content_tag :div, "#{percent}%", class: "progress-bar #{class_name}", style: "width: #{percent}%;"
      end
    end
  end