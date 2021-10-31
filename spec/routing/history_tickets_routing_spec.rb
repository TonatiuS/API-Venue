require "rails_helper"

RSpec.describe HistoryTicketsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/history_tickets").to route_to("history_tickets#index")
    end

    it "routes to #show" do
      expect(get: "/history_tickets/1").to route_to("history_tickets#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/history_tickets").to route_to("history_tickets#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/history_tickets/1").to route_to("history_tickets#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/history_tickets/1").to route_to("history_tickets#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/history_tickets/1").to route_to("history_tickets#destroy", id: "1")
    end
  end
end
