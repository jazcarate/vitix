class InternetDeMentira < Internet
  def initialize(@directorio : Hash(String, String) = {} of String => String )
  end

  def get(url)
    return HTTP::Client::Response.new(200, @directorio[url]) if @directorio[url]?
    HTTP::Client::Response.new(404, status_message: "no existe!")
  end
end
