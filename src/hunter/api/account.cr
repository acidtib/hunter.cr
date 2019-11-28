module Hunter
  class Api::Account < Api
    def me()
      params = Hash(String, String).new
      params["api_key"] = @apiKey
      params = HTTP::Params.encode(params)

      response = @httpClient.get("/#{APIVersion}/account?" + params, headers: Headers)
      handleResponse(response)
    end
  end
end