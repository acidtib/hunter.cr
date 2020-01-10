module Hunter
  class Api::Email < Api
    def finder(domain = nil, company = nil, first_name = nil, last_name = nil, full_name = nil)
      params = Hash(String, String).new
      params["domain"] = domain if domain
      params["company"] = company if company
      params["first_name"] = first_name if first_name
      params["last_name"] = last_name if last_name
      params["full_name"] = full_name if full_name
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/email-finder?" + params, headers: HEADERS)
      handle_response(response)
    end

    def verifier(email = nil)
      params = Hash(String, String).new
      params["email"] = email if email
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/email-verifier?" + params, headers: HEADERS)
      handle_response(response)
    end

    def count(domain = nil, company = nil, type = nil)
      params = Hash(String, String).new
      params["domain"] = domain if domain
      params["company"] = company if company
      params["type"] = type if type
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/email-count?" + params, headers: HEADERS)
      handle_response(response)
    end
  end
end
