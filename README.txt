USAGE
=========================================================

Follow the below steps to install dependencies, set up the database, and run the service.

In terminal:
  - Install dependencies, required before initial use of tool.
      bundle install
  - Drop, Create, and Migrate the Database.  Required before initial use of tool.  Also use when you want to clear the database to start from scratch.
      rake db:reset
  - Given an absolute path to JSON logs, seeds/adds to DB.  Subdirectories of this path will not have their logs used.
      rake fps:seed_from_path path='some/file/path'
  - Generate the averages for all Logs currently in the Database.
      rake fps:generate_fps_averages
  - Start up server.
      shotgun
  - Open browser and go to http://localhost:9393
      open http://localhost:9393
  - Use the app!

WHY RUBY & SINATRA?
=========================================================

Many tools like this on the Blizzard Mac Team are written in Ruby so I wanted to to use a language that would be easily understood by the team.  I chose Sinatra because it is specifically designed for use cases like this where only a thin web client is required.  It is also well suited for expansion or refactoring should the project grow larger than the initial assignment's scope.


SOURCES / REFERNCES
=========================================================

http://guides.rubyonrails.org
http://api.jquery.com
http://edgeguides.rubyonrails.org/active_record_postgresql.html


TOOLS/PROGRAMS/LIBRARIES/FRAMEWORKS USED
=========================================================

Programs
  - Sublime Text 2
  - Terminal / iTerm

Libraries
  - Listed inside Gemfile

Frameworks
  - Sinatra

ORM
  - ActiveRecord
