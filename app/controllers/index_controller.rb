get '/' do
  @acts = Log.select(:act).uniq.map { |log| log.act }
  @acts.sort!

  erb :index
end
