class HomeController < ApplicationController
  def index
    @artist = 'Bob Doe'
    api_data = fetch_event_api_data(params[:artist])
    @data = process_api_data(api_data)
  end

  def fetch_event_api_data(artist)
    response = Net::HTTP.get_response(URI('http://api.seatgeek.com/2/events?performers.slug=' + artist))
    api_data = JSON.parse response.body
  end

  def process_api_data(data)
    puts "Proccessing data:"
    # Uncomment the following line when debugging:
    # pp data

    # TODO:
    lowest_price = -1
    highest_price = -1
    {
      :lowest_price => lowest_price,
      :highest_price => highest_price
    }
  end
end
