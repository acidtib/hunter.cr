require "spec"
require "webmock"
require "./support/stub"
require "../src/hunter"

APIKEY = "api_key"

WebMock.allow_net_connect = false

WebMock.stub(:get, "https://api.hunter.io/v2/domain-search?domain=intercom.io&api_key=#{APIKEY}").to_return(body: Stub::DOMAIN_SEARCH)

WebMock.stub(:get, "https://api.hunter.io/v2/email-finder?domain=asana.com&first_name=Dustin&last_name=Moskovitz&api_key=#{APIKEY}").to_return(body: Stub::Email::FINDER)
WebMock.stub(:get, "https://api.hunter.io/v2/email-verifier?email=steli%40close.io&api_key=#{APIKEY}").to_return(body: Stub::Email::VERIFIER)
WebMock.stub(:get, "https://api.hunter.io/v2/email-count?domain=intercom.io").to_return(body: Stub::Email::COUNT)

WebMock.stub(:get, "https://api.hunter.io/v2/account?api_key=#{APIKEY}").to_return(body: Stub::ACCOUNT)

WebMock.stub(:get, "https://app.hyperping.io/api/v1/public/services/status.hunter.io").to_return(body: Stub::STATUS)

CLIENT = Hunter.new(APIKEY)
