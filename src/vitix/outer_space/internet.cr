require "http/client"

class Internet
  def do(host, pedido)
    if pedido.put?
      put(pedido.con_host(host), pedido.cuerpo)
    elsif pedido.post?
      post(pedido.con_host(host), pedido.cuerpo)
    else
      get(pedido.con_host host)
    end
  end

  def put(url, body)
    wrap(HTTP::Client.put url, body: body)
  end

  def post(url, body)
    wrap(HTTP::Client.post url, body: body)
  end

  def get(url)
    wrap(HTTP::Client.get url)
  end


  macro wrap(accion)
    begin
      {{accion}}
    rescue ex
      HTTP::Client::Response.new(404, status_message: ex.message)
    end
  end
end
