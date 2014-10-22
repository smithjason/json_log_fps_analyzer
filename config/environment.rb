# set up gems listed in Gemfile
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

# app-centric path constants
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))
APP_NAME = APP_ROOT.basename.to_s

# Require gems we care about
require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])
require 'rubygems'
require 'uri'
require 'pathname'
require 'pg'
require 'active_record'
require 'logger'
require 'sinatra'
require 'sinatra/reloader' if development?
require 'erb'

# set up database and models
require APP_ROOT.join('config','database')

# require our controllers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }

# set root manually so configure can be called from this file
configure do
  set :root, APP_ROOT.to_path
  set :views, File.join(Sinatra::Application.root, "app", "views")
end


