get '/acts' do
  acts = Log.select(:act).distinct.map { |log| log.act }
  acts.sort

  content_type :json
  { acts: acts }.to_json
end

get '/acts/:act/worlds' do
  act = params[:act]

  if act == "all"
    worlds = Log.select(:world).distinct.map { |log| log.world }
  else
    act = "A#{act}"
    worlds = Log.where(act: act).select(:world).distinct.map { |log| log.world }
  end

  worlds.sort

  content_type :json
  { worlds: worlds }.to_json
end
