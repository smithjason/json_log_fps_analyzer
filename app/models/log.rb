class Log < ActiveRecord::Base
  has_many :samples

  FPS_MODIFIER = 100.0

  def self.get_average_fps
    average(:average_fps).to_i / FPS_MODIFIER
  end

  def generate_average_fps
    update_column(:average_fps, samples.average(:fps).to_i)
  end

  def get_average_fps
    average_fps / FPS_MODIFIER
  end
end
