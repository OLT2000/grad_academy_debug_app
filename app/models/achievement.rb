class Achievement < ApplicationRecord
    has_many :user_achievements, dependent: :destroy
    has_many :users, through: :user_achievements

    validates :achievement_title, presence: true, uniqueness: true
    validates :achievement_description, presence: true
end