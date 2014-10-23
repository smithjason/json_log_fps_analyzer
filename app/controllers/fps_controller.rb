get '/fps' do
  act = params[:act]
  world = params[:world]

  if act == "all"
    fps =
  else
    fps = Log.where(world: world).get_average_fps
  end

  content_type :json
  { fps: fps }.to_json
end
