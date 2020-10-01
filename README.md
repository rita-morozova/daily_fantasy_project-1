# README

# Flatiron Fantasy Footabll

## Setup:

* Prior to starting the server, run bundle install, rails db:migrate and rails db:seed.

* Next open the rails console with rails c.

* Run the methods Player.update_salary_modifiers to update salary_modifier columns in the players table.

* The seed file will update with scores for players for Week 1-3. If at a future date you would like to add scores for newer weeks, download the new week's csv from https://www.fantasypros.com/nfl/reports/leaders/ and save it in the storage folder as "points_week_#weeknumber.csv" then run Contest.new_scores_for_week(#weeknumber) in rails c to update the database.


