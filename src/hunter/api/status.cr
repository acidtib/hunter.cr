module Hunter
  class Api::Status
    def ping()
      url = "https://status.hunter.io/api/v1/public/services/status.hunter.io"
      response = HTTP::Client.get(url, headers: Headers)

      Api.handleStatus(response)
    end
  end
end