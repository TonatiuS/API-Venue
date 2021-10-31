require "rails_helper"

RSpec.describe ClientUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/client_users").to route_to("client_users#index")
    end

    it "routes to #show" do
      expect(get: "/client_users/1").to route_to("client_users#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/client_users").to route_to("client_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/client_users/1").to route_to("client_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/client_users/1").to route_to("client_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/client_users/1").to route_to("client_users#destroy", id: "1")
    end
  end
end
