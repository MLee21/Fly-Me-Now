require "rails_helper"

RSpec.describe ForecastDay, "to display daily forecast" do

  describe "#day_of_the_week" do
    it "returns a day of the week" do

      data = { date: { weekday_short: "Sat"} }
      forecast = ForecastDay.new(data)
      day = forecast.day_of_the_week

      expect(day).to eq('Sat')
    end
  end

  describe "#date" do
    it "returns the date" do

      data = { date: { month: 8, day: 1 } }
      forecast = ForecastDay.new(data)
      date = forecast.date

      expect(date).to eq('08/01')
    end
  end

  describe "#image" do
    it "returns image of the forecast" do

      data = { icon_url: "http://icons.wxug.com/i/c/k/clear.gif" }
      forecast = ForecastDay.new(data)
      image = forecast.image

      expect(image).to eq('http://icons.wxug.com/i/c/k/clear.gif')
    end
  end

  describe "#high_temp" do
    it "returns high temp of the day in F" do

      data =  { high: { fahrenheit: "80" } } 
      forecast = ForecastDay.new(data)
      high_temp = forecast.high_temp

      expect(high_temp).to eq('80')
    end
  end

  describe "#low_temp" do
    it "returns low temp of the day in F" do

      data =  { low: { fahrenheit: "50" } } 
      forecast = ForecastDay.new(data)
      low_temp = forecast.low_temp

      expect(low_temp).to eq('50')
    end
  end

  describe "#precipitation_measurement" do
    it "returns amount of rainfall" do

      data = { qpf_allday: { in: 0.78 } }
      forecast = ForecastDay.new(data)
      precipitation_measurement = forecast.precipitation_measurement

      expect(precipitation_measurement).to eq('0.78 in')
    end
  end
end