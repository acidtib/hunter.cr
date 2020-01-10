require "./spec_helper"

describe Hunter do
  describe "Client" do
    it "set up" do
      CLIENT.api_key.should eq(APIKEY)
    end

    it "domain search" do
      CLIENT.domain.search(domain: "intercom.io")["data"]["domain"].should eq("intercom.io")
    end

    describe "email" do
      it "finder" do
        CLIENT.email.finder(domain: "asana.com", first_name: "Dustin", last_name: "Moskovitz")["data"]["domain"].should eq("asana.com")
      end

      it "verifier" do
        CLIENT.email.verifier(email: "steli@close.io")["data"]["email"].should eq("steli@close.io")
      end

      it "count" do
        CLIENT.email.count(domain: "intercom.io")["data"]["total"].should eq(46)
      end
    end

    it "account" do
      CLIENT.account["data"]["plan_name"].should eq("Free")
    end

    it "status" do
      CLIENT.status["hostname"].should eq("status.hunter.io")
    end
  end
end
