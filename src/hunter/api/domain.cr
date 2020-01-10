module Hunter
  class Api::Domain < Api
    def search(domain = nil, company = nil, limit = nil, offset = nil, type = nil, seniority = nil, department = nil)
      params = Hash(String, String).new
      params["domain"] = domain if domain
      params["company"] = company if company
      params["limit"] = limit if limit
      params["offset"] = offset if offset
      params["type"] = type if type
      params["seniority"] = seniority if seniority
      params["department"] = department if department
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/domain-search?" + params, headers: HEADERS)
      handle_response(response)
    end
  end
end
