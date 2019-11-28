module Hunter
  class Api::LeadsLists < Api
    def all(limit = nil, offset = nil)
      params = Hash(String, String).new
      params["limit"] = limit if limit
      params["offset"] = offset if offset
      params["api_key"] = @apiKey
      params = HTTP::Params.encode(params)

      response = @httpClient.get("/#{APIVersion}/leads_lists?" + params, headers: Headers)
      handleResponse(response)
    end

    def get(id = nil)
      params = Hash(String, String).new
      params["api_key"] = @apiKey
      params = HTTP::Params.encode(params)

      response = @httpClient.get("/#{APIVersion}/leads_lists/#{id}?" + params, headers: Headers)
      handleResponse(response)
    end

    def create(name = nil, team_id = nil)
      params = Hash(String, String).new
      params["api_key"] = @apiKey
      params = HTTP::Params.encode(params)

      body = Hash(String, String).new
      body["name"] = name if name
      body["team_id"] = team_id if team_id

      response = @httpClient.post("/#{APIVersion}/leads_lists?" + params, headers: Headers, body: body.to_json)
      handleResponse(response)
    end

    def update(id = nil, name = nil, team_id = nil)
      params = Hash(String, String).new
      params["api_key"] = @apiKey
      params = HTTP::Params.encode(params)

      body = Hash(String, String).new
      body["name"] = name if name
      body["team_id"] = team_id if team_id

      response = @httpClient.put("/#{APIVersion}/leads_lists/#{id}?" + params, headers: Headers, body: body.to_json)
      handleResponse(response)
    end

    def delete(id = nil)
      params = Hash(String, String).new
      params["api_key"] = @apiKey
      params = HTTP::Params.encode(params)

      response = @httpClient.delete("/#{APIVersion}/leads_lists/#{id}?" + params, headers: Headers)
      handleResponse(response)
    end
  end
end