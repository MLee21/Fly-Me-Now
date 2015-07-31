class FlightInformationService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("http://fs-json.demo.vayant.com")
  end

  def flights_by_location(location)
    response = connection.get("", {User: "#{ENV[CLIENT_ID]}", Pass: "#{ENV[CLIENT_SECRET]}"})
    response_body = parse(response.body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end