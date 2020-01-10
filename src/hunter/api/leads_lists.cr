module Hunter
  class Api::LeadsLists < Api
    def all(limit = nil, offset = nil)
      params = Hash(String, String).new
      params["limit"] = limit if limit
      params["offset"] = offset if offset
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/leads_lists?" + params, headers: HEADERS)
      handle_response(response)
    end

    def get(id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/leads_lists/#{id}?" + params, headers: HEADERS)
      handle_response(response)
    end

    def create(name = nil, team_id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      body = Hash(String, String).new
      body["name"] = name if name
      body["team_id"] = team_id if team_id

      response = @http_client.post("/#{APIVERSION}/leads_lists?" + params, headers: HEADERS, body: body.to_json)
      handle_response(response)
    end

    def update(id = nil, name = nil, team_id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      body = Hash(String, String).new
      body["name"] = name if name
      body["team_id"] = team_id if team_id

      response = @http_client.put("/#{APIVERSION}/leads_lists/#{id}?" + params, headers: HEADERS, body: body.to_json)
      handle_response(response)
    end

    def delete(id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.delete("/#{APIVERSION}/leads_lists/#{id}?" + params, headers: HEADERS)
      handle_response(response)
    end
  end
end
