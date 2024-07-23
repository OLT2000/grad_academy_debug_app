# Debugging Summary
## Question 1
Strategy:
- Played around with the application and different routes/requests.
- Identified typos and then used the search bar to locate the exact typo in the directory

### Sign Up Page
`app/views/users/new.html.erb 14:` Changed "form.label :usernam" to "form.label :username"
### Welcome Page
`config/locales/en.yml 34:35` Changed 'Read' to 'Ready' and 'Welcom' to 'Welcome'.
### 404
`config/locales/en.yml 2:` Changed 'pag' to 'page' and 'fore' to 'fore'.


## Question 2
### Additional Horizontal Rule
Same as footer?
### Additional Footer
`app/views/layouts/application.html.erb 25:` Removed the footer render from the application base template.

### Missing or incorrect HTML
`app/view/locales/en.yml 34:` Removed html from translations file. Replaced with %{username}.\
`app/views/home/_welcome.html.erb 3:7` Removed surrounding speech marks from the function args. Also added breakpoints.

### Missing Horizontal Rule
`app/view/locales/en.yml 5:` Added a header rule with solid line.

### Size of Logo
`app/assets/stylesheets/components/_navbar.scss 12:` Changed logo width to 1.65rem.

### Incorrect Styling of Sign In Page
`app/views/home/_welcome.html.erb 16:17` Added list items

### Image not showing up on sign up page
`app/helpers/application_helper.rb 21:` Added code to render the sign up image 
`app/views/users/new.html.erb 7:` call method to display image on the page

### Inacessible 'text light'
`app/views/users/new.html.erb` in this file changed the bootstrap code to "text-dark" 


## Question 3
### Missing styling for buttons on the sign in, sign up and welcome pages
`app/views/home/_welcome.html.erb 26:` Changed "btn btn-danger"

### Incorrect Page Title
`app/helpers/application_helper.rb 15:` Changed return to base_title and base_title + "-" + page_title


## Question 4
### Missing Table Header in Check Your Answers
`app/views/steps/check_your_answers.html.erb` Added missing headers in the file

### Percentage Score Calcluation Rounding Error
`app/helpers/quiz_results_helper.rb 55` added .round 2

### Missing Table Header in Scoreboard page
`app/views/steps/scoreboard.html.erb 7:13` Added code to create header using translations yml

### Navbar missing flag
`app/views/shared/_navbar.html.erb 21:` Used a partial to render a dynamic navbar flag.

### Next Button Not Working
`app/controllers/concerns/quiz_form_handler.rb 8:` incremented current_step by 1 instead of 0

### Start Button not starting quiz
`app/views/home/_welcome.html.erb 26:` Changed link_to content to "Start Quiz" and step_path(id: 1)

### Incorrect Text on welcome page
`app/view/locales/en.yml 34:` Removed html from translations file. Replaced with %{username}.

### Incorrect input type on MC
`app/views/steps/_choice_questions.html.erb 10:25` Changed button type to radio.

### Incorrect Case sensitive input
`app/helpers/quiz_results_helper.rb 32:38` Changed evaluate_results function. Implemented .downcase.strip to normalise values.

### Incorrect check your answers ERB view
`app/views/steps/check_your_answers.html.erb 25` Added = sign to display content.

### Back Button
`app/views/steps/_show.html.erb 18:` Subtracted 1 from the current_setp argument passed into step_path


## Question 5
###  Results Page Table
`app/views/steps/results.html.erb` Fixed errors to display results correctly

### Fix Download
`app/helpers/scoreboard_helper.rb 21:` Changed the encoding to UTF-8 

## Question 6
### Calculation Wrong
`app/helpers/quiz_results_helper.rb 142:147` Changed comparison and return value.

## Question 7
### Fix Identical Answers in Quiz
`app/views/steps/_choice_questions.html.erb 10:25` Changed hash for value[]

## Question 8
### Sign Up Not Saving new user
`app/controllers/users_controller.rb 28:` Added user_params to the sibm_up so that they're added to the DB.

### Sign Out Doesn't work
`app/views/shared/_signout_modal.html.erb 15:` Changed sign_out modal to direct to logout_path()

### Submit Quiz
`app/views/shared/_submit_modal.html.erb 14:` Changed modal to redircet to correct location.

## Question 9
### Flexbox
`app/views/steps/scoreboard.html.erb 2:` Changed d-inline-flex to d-flex flex-column. Matched the original HTML.

## Question 10
### Unneeded Column
Definitely didn't break it first...
I looked in the schema file to see which columns were being created. Percentage and Score seemed similar so I looked into it.
I couldn't find many occurrences of percentage.
I then went into the rails terminal uaing `rails c`.
From here, I looked at `Answer.all` and saw that percentage was nil.
In the usual command line terminal I ran `rails generate migration RemovePCTFromAnswer` to generate a new migration.
Then edited the migration so that the percentage column was dropped.
Run `db:migrate` to run new migrations.
