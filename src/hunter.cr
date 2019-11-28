require "http/client"
require "json"

require "./hunter/**"

module Hunter
  VERSION = "0.1.0"

  def self.new(apiKey : String)
    Client.new(apiKey)
  end
end