class HardWorker
  include Sidekiq::Worker

  def perform(name, count)
    #get weather data
  end
end