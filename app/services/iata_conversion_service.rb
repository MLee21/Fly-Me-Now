require 'uri'

class IataConversionService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new("https://airport.api.aero/")
  end

  def iata_converter(city)
    uri_city = URI.encode(city)
    response = connection.get("airport/match/#{uri_city}", {
      user_key: "8fdd2f669ad0c36eee5dc1d43421fa01"
    })
    response_body = parse(response.body.slice(9..-2))
  end
  
  def main_iata_code(city)
    city = iata_converter(city)
    airport_code = city[:airports].map do |airport|
      if airport[:name].include?(airport[:city])
        airport[:code]
      end
    end.compact.join
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end

