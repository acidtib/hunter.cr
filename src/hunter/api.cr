module Hunter
  class Api
    APIVERSION = "v2"
    HEADERS    = HTTP::Headers{"Content-Type" => "application/json", "Accept" => "application/json", "User-Agent" => "hunter.cr"}

    def initialize(@http_client : HTTP::Client, @api_key : String)
    end

    # 200 - OK / The request was successful
    #
    # 201 - Created / The request was successful and the resource was created
    #
    # 202 - Email verification in progress / The Email verification is still in progress. Feel free to make the same verification again as often as you want, it will only count as a single request until we return the response
    #
    # 204 - No content / The request was successful and no additional content was sent
    #
    # 222 - Email verification failed / The Email verification failed because of an unexpected response from the remote SMTP server. This failure is outside of our control. We advise you to retry later
    #
    # 400 - Bad request / Your request was not valid
    #
    # 401 - Unauthorized / No valid API key was provided
    #
    # 403 - Forbidden / You have reached the rate limit
    #
    # 404 - Not found / The requested resource does not exist
    #
    # 422 - Unprocessable entity / Your request is valid but the creation of the resource failed. Check the errors
    #
    # 429 - Too many requests / You have reached your usage limit. Upgrade your plan if necessary
    #
    # 451 - Unavailable for legal reasons / The person behind the requested resource has asked us directly or indirectly to stop the processing of this resource. For this reason, you shouldn't process this resource yourself in any way
    #
    # 5XX - Server errors / Something went wrong on Hunter's end
    def handle_response(response : HTTP::Client::Response) : JSON::Any
      case response.status_code
      when 200, 201, 202, 222
        JSON.parse(response.body)
      when 204
        JSON.parse(JSON.build do |json|
          json.object do
          end
        end)
      when 400, 401, 403, 404, 422, 429, 451
        JSON.parse(response.body)
      when 500
        JSON.parse(response.body)
      else
        JSON.parse(JSON.build do |json|
          json.object do
            json.field "errors" do
              json.array do
                json.object do
                  json.field("id", "total_meltdown")
                  json.field("code", 9000)
                  json.field("details", "Something bad happened")
                end
              end
            end
          end
        end)
      end
    end

    def self.handle_status(response : HTTP::Client::Response) : JSON::Any
      case response.status_code
      when 200
        body = JSON.parse(response.body)["data"]

        JSON.parse(JSON.build do |json|
          json.object do
            json.field("hostname", body["hostname"])
            json.field "services" do
              json.array do
                body["services"].as_a.each do |s|
                  json.object do
                    json.field("alias", s["alias"])
                    json.field("uptime", s["uptime"])
                    json.field("is_down", s["isDown"])
                  end
                end
              end
            end
          end
        end)
      else
        JSON.parse(JSON.build do |json|
          json.object do
            json.field "errors" do
              json.array do
                json.object do
                  json.field("id", "total_meltdown")
                  json.field("code", 9000)
                  json.field("details", "Something bad happened")
                end
              end
            end
          end
        end)
      end
    end
  end
end
