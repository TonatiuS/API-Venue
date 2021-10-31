require "rails_helper"

RSpec.describe StandUsersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stand_users").to route_to("stand_users#index")
    end

    it "routes to #show" do
      expect(get: "/stand_users/1").to route_to("stand_users#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stand_users").to route_to("stand_users#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stand_users/1").to route_to("stand_users#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stand_users/1").to route_to("stand_users#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stand_users/1").to route_to("stand_users#destroy", id: "1")
    end
  end
end
