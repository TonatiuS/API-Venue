require "rails_helper"

RSpec.describe DateVenuesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/date_venues").to route_to("date_venues#index")
    end

    it "routes to #show" do
      expect(get: "/date_venues/1").to route_to("date_venues#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/date_venues").to route_to("date_venues#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/date_venues/1").to route_to("date_venues#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/date_venues/1").to route_to("date_venues#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/date_venues/1").to route_to("date_venues#destroy", id: "1")
    end
  end
end
