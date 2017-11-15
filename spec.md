# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
# The models inherit from ActiveRecord::Base and ActiveRecord connects to sqlite3 DB in environment.rb file
- [x] Include more than one model class (list of model class names e.g. User, Post, Category)
# I used 3 models (classes): User, Product and Review
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts)
# User has many Reviews, Product has many Reviews
- [x] Include user accounts
# Yes
- [x] Ensure that users can't modify content created by other users
# Yes, implemented through current_user method
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
# Reviews that belong to both Users and Products can be created, displayed, edited and deleted
- [x] Include user input validations
# User can't login or signup without valid input
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new)
# Implemented using session hash available in both controllers and views (empty username or password will give error message on /login and /signup pages, adding a product or review without logging in first will give an error message)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
