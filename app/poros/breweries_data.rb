class BreweriesData
  attr_reader :breweries_list

  def initialize(breweries_data)
    @breweries_list = breweries_data.map do |brewery|
      {
        id: brewery[:id],
        name: brewery[:name],
        brewery_type: brewery[:brewery_type]
      }
    end
  end
end
