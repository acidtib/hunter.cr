module Hunter
  class Api::Leads < Api
    def all(limit = nil, lead_list_id = nil, email = nil, first_name = nil, last_name = nil, position = nil, company = nil, industry = nil, website = nil, country_code = nil, company_size = nil, source = nil, twitter = nil, linkedin_url = nil, phone_number = nil, sync_status = nil, sending_status = nil, last_activity_at = nil, query = nil, offset = nil)
      params = Hash(String, String).new
      params["limit"] = limit if limit
      params["lead_list_id"] = lead_list_id if lead_list_id
      params["email"] = email if email
      params["first_name"] = first_name if first_name
      params["last_name"] = last_name if last_name
      params["position"] = position if position
      params["company"] = company if company
      params["industry"] = industry if industry
      params["website"] = website if website
      params["country_code"] = country_code if country_code
      params["company_size"] = company_size if company_size
      params["source"] = source if source
      params["twitter"] = twitter if twitter
      params["linkedin_url"] = linkedin_url if linkedin_url
      params["phone_number"] = phone_number if phone_number
      params["sync_status"] = sync_status if sync_status
      params["sending_status"] = sending_status if sending_status
      params["last_activity_at"] = last_activity_at if last_activity_at
      params["query"] = query if query
      params["offset"] = offset if offset
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/leads?" + params, headers: HEADERS)
      handle_response(response)
    end

    def get(id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.get("/#{APIVERSION}/leads/#{id}?" + params, headers: HEADERS)
      handle_response(response)
    end

    def create(email = nil, first_name = nil, last_name = nil, position = nil, company = nil, company_industry = nil, company_size = nil, confidence_score = nil, website = nil, country_code = nil, linkedin_url = nil, phone_number = nil, twitter = nil, notes = nil, source = nil, lead_list_id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      body = Hash(String, String).new
      body["email"] = email if email
      body["first_name"] = first_name if first_name
      body["last_name"] = last_name if last_name
      body["position"] = position if position
      body["company"] = company if company
      body["company_industry"] = company_industry if company_industry
      body["company_size"] = company_size if company_size
      body["confidence_score"] = confidence_score if confidence_score
      body["website"] = website if website
      body["country_code"] = country_code if country_code
      body["linkedin_url"] = linkedin_url if linkedin_url
      body["phone_number"] = phone_number if phone_number
      body["twitter"] = twitter if twitter
      body["notes"] = notes if notes
      body["source"] = source if source
      body["lead_list_id"] = lead_list_id if lead_list_id

      response = @http_client.post("/#{APIVERSION}/leads?" + params, headers: HEADERS, body: body.to_json)
      handle_response(response)
    end

    def update(id = nil, email = nil, first_name = nil, last_name = nil, position = nil, company = nil, company_industry = nil, company_size = nil, confidence_score = nil, website = nil, country_code = nil, linkedin_url = nil, phone_number = nil, twitter = nil, notes = nil, source = nil, lead_list_id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      body = Hash(String, String).new
      body["email"] = email if email
      body["first_name"] = first_name if first_name
      body["last_name"] = last_name if last_name
      body["position"] = position if position
      body["company"] = company if company
      body["company_industry"] = company_industry if company_industry
      body["company_size"] = company_size if company_size
      body["confidence_score"] = confidence_score if confidence_score
      body["website"] = website if website
      body["country_code"] = country_code if country_code
      body["linkedin_url"] = linkedin_url if linkedin_url
      body["phone_number"] = phone_number if phone_number
      body["twitter"] = twitter if twitter
      body["notes"] = notes if notes
      body["source"] = source if source
      body["lead_list_id"] = lead_list_id if lead_list_id

      response = @http_client.put("/#{APIVERSION}/leads/#{id}?" + params, headers: HEADERS, body: body.to_json)
      handle_response(response)
    end

    def delete(id = nil)
      params = Hash(String, String).new
      params["api_key"] = @api_key
      params = HTTP::Params.encode(params)

      response = @http_client.delete("/#{APIVERSION}/leads/#{id}?" + params, headers: HEADERS)
      handle_response(response)
    end
  end
end