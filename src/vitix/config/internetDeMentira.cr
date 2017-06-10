class InternetDeMentira < Internet
  def initialize(@directorio : Hash(String, String) )
  end

  def get(url)
    @directorio.fetch url
  end
end
