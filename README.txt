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
