class Sample < ActiveRecord::Base
  belongs_to :log

  FPS_MODIFIER = 100.0

  def self.get_average_fps
    average(:fps).to_i / FPS_MODIFIER
  end
end
