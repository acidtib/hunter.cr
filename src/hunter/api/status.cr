module Hunter
  class Api::Status
    def ping()
      url = "https://status.hunter.io/api/v1/public/services/status.hunter.io"

      response = HTTP::Client.get(url, headers: Headers)
      
      if response.status_code == 200
        body = JSON.parse(response.body)["data"]

        result = Hash(String, String | Array(NamedTuple(alias: String, uptime: String, isDown: String))).new
        result["hostname"] = body["hostname"].to_s
        result["services"] = body["services"].as_a.map do |s|
          {
            alias: s["alias"].to_s,
            uptime: s["uptime"].to_s,
            isDown: s["isDown"].to_s
          }
        end
        result
      end
    end
  end
end