class BreweriesFacade
  def self.get_breweries_data(city_state, quantity)
    breweries_data = BreweriesService.retrieve_breweries(city_state, quantity)
    BreweriesData.new(breweries_data)
  end
end
