class ForecastDay
  attr_reader :forecast_data

  def initialize(data)
    @forecast_data = data
  end

  def day_of_the_week
    access_date[:weekday_short]
  end

  def date
    "#{month}/#{day}"
  end

  def image
    forecast_data[:icon_url]
  end

  def high_temp
    forecast_data[:high][:fahrenheit]
  end

  def low_temp
    forecast_data[:low][:fahrenheit]
  end

  def precipitation_measurement
    "#{precipitation} in"
  end

  private
  def month
    access_date[:month].to_s.rjust(2, '0')
  end

  def day
    access_date[:day].to_s.rjust(2, '0')
  end

  def access_date
    forecast_data[:date]
  end

  def precipitation
    forecast_data[:qpf_allday][:in].to_s
  end

end