require "http/client"
require "json"

require "./hunter/**"

module Hunter
  VERSION = "0.1.0"

  def self.new(api_key : String)
    Client.new(api_key)
  end
end