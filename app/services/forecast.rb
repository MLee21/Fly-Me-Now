class Forecast
  attr_reader :forecast_data
  
  def initialize(data)
    @forecast_data = data
  end


  def day_of_the_week
    forecast_data.first[:date][:weekday_short]
  end

  def date
    "#{month}/#{day}"
  end

  def month
    forecast_data.first[:date][:month].to_s.rjust(2, '0')
  end

  def day
    forecast_data.first[:date][:day].to_s.rjust(2, '0')
  end
end