module Hunter
  class Api::Account < Api
    def me
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/account?" + params, headers: HEADERS)
      handle_response(response)
    end
  end
end
