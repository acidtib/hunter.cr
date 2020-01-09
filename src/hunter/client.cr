module Hunter
  class Client
    HOST = URI.parse("https://api.hunter.io")
    getter api_key

    def initialize(@api_key : String)
      @http_client = HTTP::Client.new(HOST)
    end

    def domain
      Api::Domain.new(@http_client, @api_key)
    end

    def account
      Api::Account.new(@http_client, @api_key).me
    end

    def email
      Api::Email.new(@http_client, @api_key)
    end

    def leads
      Api::Leads.new(@http_client, @api_key)
    end

    def leadslists
      Api::LeadsLists.new(@http_client, @api_key)
    end

    def status
      Api::Status.new.ping
    end
  end
end