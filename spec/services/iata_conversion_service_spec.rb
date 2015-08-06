require "rails_helper"

RSpec.describe 'IataConversionService', type: :model do
  attr_reader :service 

  before(:each) do 
    @service = IataConversionService.new
  end

  it "returns Iata codes" do
    VCR.use_cassette("get_iata_codes") do 
      city = "Denver"
      codes = service.iata_converter(city)
      expect(codes).to be_an_instance_of(Hash)
    end
  end

  it "returns iata code for Denver" do 
    VCR.use_cassette("get_iata_codes") do 
      city = "Denver"
      codes = service.iata_converter(city)
      expect(codes[:airports][0][:code]).to eq("APA")
    end
  end

  it "returns iata code for Denver" do 
    VCR.use_cassette("get_iata_codes") do 
      city = "Denver"
      codes = service.iata_converter(city)
      expect(codes[:airports][1][:code]).to eq("DEN")
    end
  end

  it "will only return the main airport for a city" do 
    VCR.use_cassette("get_iata_codes") do 
      city = "Denver"
      city_code = service.main_iata_code(city)
      expect(city_code).to eq("DEN")
    end
  end

  it "will return the main airport for a different city" do 
    VCR.use_cassette("different_city_code") do 
      city = "Austin"
      city_code = service.main_iata_code(city)
      expect(city_code).to eq("AUS")
    end
  end

  it "will return the main airport iata for a double word city" do 
    VCR.use_cassette("two-word-city") do 
      city = "Los Angeles"
      city_code = service.main_iata_code(city)
      expect(city_code).to eq("LAX")
    end
  end
end

