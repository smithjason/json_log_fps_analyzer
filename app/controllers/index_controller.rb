get '/' do
  @acts = Log.select(:act).uniq.map { |log| log.act }.sort

  erb :index
end
