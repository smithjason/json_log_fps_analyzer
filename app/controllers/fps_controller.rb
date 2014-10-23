get '/fps' do
  act = params[:act]
  world = params[:world]

  if world == "all"
    fps = Sample.get_average_fps
  else
    fps = Log.where(world: world).get_average_fps
  end

  puts "********* FPS ***********"
  puts "#{fps}"

  content_type :json
  { act: act, world: world, fps: fps }.to_json
end