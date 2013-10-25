class HomeController < ApplicationController
  def index
    @artist = 'Bob Doe'
    api_data = fetch_event_api_data(params[:artist])
    @data = process_api_data(api_data)
  end

  def fetch_event_api_data(artist)
    response = Net::HTTP.get_response(URI('http://api.seatgeek.com/2/events?performers.slug=' + artist.to_s))
    api_data = JSON.parse response.body
  end

  def process_api_data(data)
   data.each do |key, value|
      if key = events
        events.each do |event|
          prices = []
          prices << event.stats 
        end
      end
    end  

    # Uncomment the following line when debugging:
    # pp data
    


    # TODO:
    lowest_price = prices.min
    highest_price = prices.max
      {
        :lowest_price => lowest_price,
        :highest_price => highest_price
      }
    end
  end
end
