require 'spec_helper'

describe HomeController do

  describe "GET 'index' " do
    it "returns http success" do
      get 'index'
      response.should be_success
    end

    it "fetches api data based on an artist parameter" do
      expect(@controller).to receive(:fetch_event_api_data).with('the-bad-plus')
      expect(@controller).to receive(:process_api_data)

      get 'index', { :artist => 'the-bad-plus' }
      expect(response).to be_success
    end

    it "calculates event data based on seatgeek's api response" do
      VCR.use_cassette('bieber_events') do
        api_data = @controller.fetch_event_api_data('justin-bieber')

        data = @controller.process_api_data(api_data)
        expect(data).to eq(Hash)
        expect(data[:lowest_price]).to eq(20)
        expect(data[:highest_price]).to eq(7118)
      end
    end
  end
end
