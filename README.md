# Debugging Summary
## Question 1
Strategy:
- Played around with the application and different routes/requests.
- Identified typos and then used the search bar to locate the exact typo in the directory

### Sign Up Page
In 
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
`app/view/locales/en.yml 34:` Removed html from translations file. Replaced with %{username}.
`app/views/home/_welcome.html.erb 3:7` Removed surrounding speech marks from the function args. Also added breakpoints.

### Missing Horizontal Rule
`app/view/locales/en.yml 5:` Added a header rule with solid line.

### Size of Logo
`app/assets/stylesheets/components/_navbar.scss 12:` Changed logo width to 1.65rem.

### Incorrect Styling of Sign In Page

### Image not showing up on sign ip page

### Inacessible 'text light'


## Question 3
### Missing styling for buttons on the sign in, sign up and welcome pages

### Incorrect Page Title


## Question 4
### Missing Table Header in Check Your Answers

### Percentage Score Calcluation Rounding Error

### Missing Table Header in Scoreboard page

### Navbar missing flag

### Next Button Not Working

### Start Button not starting quiz

### Incorrect Text on welcome page

### Incorrect input type on MC

### Incorrect Case sensitive input

### Incorrect check your answers ERB view

### Back Button


## Question 5
###  Results Page Table

### Fix Download


## Question 6
### Calcukation Wrong


## Question 7
### Fix Identical Answers in Quiz


## Question 8
### Sign Up Not Saving new user

### Sign Out Doesn't work

### Submit Quiz


## Question 9
### Flexbox


## Question 10
### Unneeded Column
