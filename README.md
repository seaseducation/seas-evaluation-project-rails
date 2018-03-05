SEAS Evaluation Project
-

_This is a small project meant for evaluation purposes only._

### Problem

By using a paperless system for managing individualized education programs for their students, school staff will save time, gain access to valuable analytics, and have a higher level of assurance that their operations are compliant with state and federal law.

As a first step toward this goal, we need to be able to create data for Schools and Students within our system.  Currently, this application is a very basic prototype satisfying those requirements, but we'd like you to provide some enhancements.

The users of this application will be administrative staff within a school district.



### Current Functionality

The application currently handles basic CRUD operations for the School and Student models.

- A user can create a Student - first name, last name, Grade, and School are required.  Program is optional
- A user can create a School - title, city, and state are required
- A user can view, list, edit, and delete Schools and Students
- Grades can not be created through the UI, and are instead created as seed data.  Title is required, and must be the string representing a number from 1 through 12, ordinalized (e.g. "1st", "12th")
-  Programs can not be created through the UI, and are also seeded.  A Title is required and must be either "IEP" or "504"



### Requirements

- Students are nested under schools rather than at the top-level.  (`/schools/1/students` for Student index instead of `/students`)
- Students have an additional social security number attribute.  Think about this data point from a security perspective.



### Additional Guidance

This project is meant to evaluate your approach to product design, implementation choices, and testing decisions.  Upon submission, we would like to see that you:

- Take the user's experience into consideration
- Refactor, both in support of changing requirements as well as avoidance and reduction of technical debt
- Test functionality at appropriate levels

Approach the project as you would a work assignment.  If you believe it would be beneficial to introduce a new feature or technology, feel free to do so.  If you believe any of the existing code or markup is suboptimal, feel free to make improvements to the best of your judgment.

Given the nature of this project, your changes will be evaluated assuming you have spent an appropriate amount of time and effort.  In other words, we aren't paying you for this, so we aren't expecting you to spend an excessive amount of time on it.

Please take note of:

- How you chose to meet the above requirements, as well as why
- Any assumptions you made about vague business requirements
- How you might choose to move forward with the project in the next iteration
- Improvements you would have made but didn't because of time constraints



### Technology

- Rails 5.1.5
- Ruby 2.5.0
- SQLite (Postgres OK)
- RSpec, Capybara, FactoryBot, Faker
- Bootstrap



### Initial Setup

`bundle exec rails db:create db:migrate db:seed`

`RAILS_ENV=test bundle exec rails db:create db:migrate`



### Development

`bundle exec rails s`

Make sure you have seeded the database before beginning development.  While Schools and Students can be created via the UI, Grades and Programs can not.  Furthermore, while Programs are optional for a Student, Grades are not.  Hence, without seeding, creating a valid Student will be impossible via the UI.



### Testing

`bundle exec rspec`

You will find a small suite of existing specs at the feature-level and model-level.  While adjusting these for the aforementioned requirements, feel free to expand on and modify the suite as you see fit.



### Version Control

This project is a git repository, so please track your changes via commits.  Upon submission, there should be no changes staged, unstaged, or stashed.

