get '/fps' do
  act = params[:act]
  world = params[:world]

  if world == "all"
    if act == "all"
      fps = Sample.get_average_fps
    else
      act = "A#{act}"
      fps = Log.where(act: act).get_average_fps
    end
  else
    fps = Log.where(world: world).get_average_fps
  end

  content_type :json
  { act: act, world: world, fps: fps }.to_json
end
