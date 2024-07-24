# Include QuizResultsHelper to access helper methods
include QuizResultsHelper

achievements_data = [
  { achievement_title: "No Room For Error", achievement_description: "Achieve 100% On a Quiz"},
  { achievement_title: "Noob Achievement", achievement_description: "Complete Your First Quiz"}
]

achievements_data.each do |ach_data|
  Achievement.find_or_create_by(achievement_title: ach_data[:achievement_title]) do |new_ach|
      new_ach.achievement_title = ach_data[:achievement_title]
      new_ach.achievement_description = ach_data[:achievement_description]
    end
  end


  test_achievement = [
    {user_id: 1, achievement_id: 1}
  ]
  test_achievement.each do |test_ach|
    UserAchievement.find_or_create_by(user_id: test_ach[:user_id], achievement_id: test_ach[:achievement_id]) do |new_ach|
      new_ach.user_id = test_ach[:user_id]
      new_ach.achievement_id = test_ach[:achievement_id]
    end
  end


# Define sample users (assuming User model exists)
users_data = [
  { email: 'test@test.com', username: 'test', password: 'test' },
  { email: 'alice@example.com', username: 'alice', password: 'password' },
  { email: 'bob@example.com', username: 'bob', password: 'password' },
  { email: 'charlie@example.com', username: 'charlie', password: 'password' }
]

# Create users if they don't already exist
users_data.each do |user_data|
  user = User.find_or_create_by(email: user_data[:email]) do |new_user|
    new_user.username = user_data[:username]
    new_user.password = user_data[:password]
  end

  if user.persisted?
    puts "Created user: #{user.username}"
  else
    puts "User #{user.username} already exists."
  end
end

# Define example answers for each user
answers_data = {
  'test' => {
    question_page_1: ['Tibia', 'Isaac Newton', 'Microsoft', 'Mount Fuji', 'Oxygen'],
    question_page_2: ['Photosynthesis', 'Ornithology', 'Dorothy Hodgkin', 'Ruby', 'F. Scott Fitzgerald'],
    question_page_3: %w[giraffe pacific lima au ruby]
  },
  'test' => {
    question_page_1: ['Femur', 'Isaac Newton', 'Intel', 'Mount Everest', 'Oxygen'],
    question_page_2: ['Photosynthesis', 'Entonology', 'Dorothy Hodgkin', 'Python', 'F. Scott Fitzgerald'],
    question_page_3: %w[giraffe nope lima pb wrong]
  },
  'test' => {
    question_page_1: ['Tibia', 'Isaac Newton', 'Intel', 'Mount Everest', 'Nitrogen'],
    question_page_2: ['Photosynthesis', 'Ornithology', 'Dorothy Hodgkin', 'Ruby', 'F. Scott Fitzgerald'],
    question_page_3: %w[n pacific lima au ruby]
  },
  'test' => {
    question_page_1: ['Tibia', 'Isaac Newton', 'Intel', 'Mount Everest', 'Nitrogen'],
    question_page_2: ['Photosynthesis', 'Ornithology', 'Dorothy Hodgkin', 'Ruby', 'F. Scott Fitzgerald'],
    question_page_3: %w[giraffe o lima au ruby]
  },
  'test' => {
    question_page_1: ['Tibia', 'Isaac Newton', 'Intel', 'Mount Everest', 'Nitrogen'],
    question_page_2: ['Photosynthesis', 'Ornithology', 'Dorothy Hodgkin', 'Ruby', 'F. Scott Fitzgerald'],
    question_page_3: %w[giraffe pacific p au ruby]
  },
  'test' => {
    question_page_1: ['Tibia', 'Isaac Newton', 'Intel', 'Mount Everest', 'Nitrogen'],
    question_page_2: ['Photosynthesis', 'Ornithology', 'Dorothy Hodgkin', 'Ruby', 'F. Scott Fitzgerald'],
    question_page_3: %w[giraffe pacific lima e ruby]
  },
  'alice' => {
    question_page_1: ['Femu', 'Isaac Newton', 'Intel', 'Mount Everest', 'Nitrogen'],
    question_page_2: ['Photosynthesis', 'Entomology', 'Dorothy Hodgkin', 'Python', 'J.D. Salinger'],
    question_page_3: %w[no pacific lima au lol]
  },
  'bob' => {
    question_page_1: ['Femur', 'Albert Einstein', 'Intel', 'Mount Everest', 'Nitrogen'],
    question_page_2: ['Photosynthesis', 'Ichthyology', 'Marie Curie', 'Python', 'J.D. Salinger'],
    question_page_3: %w[giraffe pacific lima au ruby]
  },
  'charlie' => {
    question_page_1: ['Tibia', 'Albert Einstein', 'Intel', 'Mount Everest', 'Nitrogen'],
    question_page_2: ['Photosynthesis', 'Entomology', 'Rosalind Franklin', 'Python', 'J.D. Salinger'],
    question_page_3: %w[shark pacific lima pb ruby]
  }
}

# Create answers for each user if they don't already exist
answers_data.each do |username, answers|
  user = User.find_by(username: username)

  if user
      answer = Answer.create!(
        user: user,
        answer: answers,
        date_attempted: Time.zone.today,
        completed: true
      )

      # Use the created answer object for scoring and other operations
      quiz_results = answer

      score_percentage = score_percentage(quiz_results) || 0

      answer.update(score: score_percentage)

      puts "Created answers for user: #{user.username}, Score: #{score_percentage}%"

  else
    puts "User #{username} not found."
  end
end
