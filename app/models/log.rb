class Log < ActiveRecord::Base
  serialize :location, Hash

  has_many :samples

  FPS_MODIFIER = 100.0

  def generate_average_fps
    update_column(:average_fps, samples.average(:fps).to_i)
  end

  def get_average_fps
    average_fps / FPS_MODIFIER
  end

  def self.get_average_fps
    average(:average_fps).to_i / FPS_MODIFIER
  end

  def self.generate_average_fps
    all.each do |log|
      log.generate_average_fps
    end
  end
end
