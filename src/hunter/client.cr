module Hunter
  class Client
    Host = URI.parse("https://api.hunter.io")
    getter apiKey

    def initialize(@apiKey : String)
      @httpClient = HTTP::Client.new(Host)
    end

    def domain
      Api::Domain.new(@httpClient, @apiKey)
    end

    def account
      Api::Account.new(@httpClient, @apiKey).me
    end

    def email
      Api::Email.new(@httpClient, @apiKey)
    end

    def leads
      Api::Leads.new(@httpClient, @apiKey)
    end

    def leadslists
      Api::LeadsLists.new(@httpClient, @apiKey)
    end
  end
end