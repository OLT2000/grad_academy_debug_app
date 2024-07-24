# app/services/achievement_service.rb
class AchievementService
    def self.add_achievement_to_user(user, achievement_id)
      achievement = Achievement.find(achievement_id)
      if user.achievements.include?(achievement)
        { success: false, message: 'Achievement already obtained.' }
      else
        user.achievements << achievement
        { success: true, message: 'Achievement added successfully.' }
      end
    end
  end