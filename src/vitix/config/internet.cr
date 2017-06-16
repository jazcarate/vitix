require "http/client"

class Internet
  def get(url)
    begin
      HTTP::Client.get url
    rescue ex
      HTTP::Client::Response.new(404, status_message: ex.message)
    end
  end
end
