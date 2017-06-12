require "http/client"

class Internet
  def get(url)
    HTTP::Client.get url
  end
end
