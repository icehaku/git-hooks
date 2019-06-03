require "rails_helper"

RSpec.describe EventsController, type: :controller do

  it { is_expected.to use_before_action :auth }

  describe "#index" do
    it "has a 200 status code" do
      get :index, format: :json

      expect(response.status).to eq(200)
    end
  end
end
