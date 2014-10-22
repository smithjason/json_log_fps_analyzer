class Collection
  attr_reader :datetime,
              :seed,
              :act,
              :world,
              :scene,
              :quest,
              :quest_step,
              :class,
              :samples

  def initialize(args)
    @datetime     = args[:datetime]
    @seed         = args[:seed]
    @act          = args[:act]
    @world        = args[:world]
    @scene        = args[:scene]
    @quest        = args[:quest]
    @quest_step   = args[:quest_step]
    @location     = args[:location]
    @class        = args[:class]
    @samples      = args[:samples]
  end
end
