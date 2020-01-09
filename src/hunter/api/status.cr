module Hunter
  class Api::Status
    def ping()
      url = "https://status.hunter.io/api/v1/public/services/status.hunter.io"
      response = HTTP::Client.get(url, headers: HEADERS)

      Api.handle_status(response)
    end
  end
end